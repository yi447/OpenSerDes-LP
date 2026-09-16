import numpy as np
import matplotlib.pyplot as plt
from pathlib import Path

RESULTS = Path("analog/results")
DOCS = Path("docs/results")
DOCS.mkdir(parents=True, exist_ok=True)


def load_wrdata(path, num_signals):
    # ngspice wrdata 第一行可能是欄位名稱
    data = np.genfromtxt(path, skip_header=1)

    # 刪掉空白/無效列
    data = data[np.all(np.isfinite(data), axis=1)]

    # 第一欄當時間；最後 num_signals 欄當訊號
    t = data[:, 0]
    signals = data[:, -num_signals:]

    return t, signals


# ============================================================
# TX
# ============================================================

t, sig = load_wrdata(
    RESULTS / "tx_waveform.csv",
    5
)

vinp  = sig[:, 0]
vinn  = sig[:, 1]
outp  = sig[:, 2]
outn  = sig[:, 3]
vdiff = sig[:, 4]

t_ns = t * 1e9

plt.figure(figsize=(10, 5))

plt.plot(t_ns, outp, label="TX+")
plt.plot(t_ns, outn, label="TX-")

plt.xlabel("Time (ns)")
plt.ylabel("Voltage (V)")
plt.title("SKY130 Differential TX Output")
plt.legend()
plt.grid(True)
plt.tight_layout()

plt.savefig(
    DOCS / "tx_differential_waveform.png",
    dpi=180
)

plt.close()


plt.figure(figsize=(10, 5))

plt.plot(t_ns, vdiff)

plt.xlabel("Time (ns)")
plt.ylabel("Differential Voltage (V)")
plt.title("SKY130 TX Differential Swing")
plt.grid(True)
plt.tight_layout()

plt.savefig(
    DOCS / "tx_vdiff.png",
    dpi=180
)

plt.close()


# ============================================================
# RX
# ============================================================

t, sig = load_wrdata(
    RESULTS / "rx_waveform.csv",
    4
)

rinp  = sig[:, 0]
rinn  = sig[:, 1]
vamp  = sig[:, 2]
rxout = sig[:, 3]

t_ns = t * 1e9

plt.figure(figsize=(10, 6))

plt.plot(t_ns, rinp, label="RX input +")
plt.plot(t_ns, rinn, label="RX input -")
plt.plot(t_ns, rxout, label="Recovered RX output")

plt.xlabel("Time (ns)")
plt.ylabel("Voltage (V)")
plt.title("SKY130 RX Front-End Signal Recovery")
plt.legend()
plt.grid(True)
plt.tight_layout()

plt.savefig(
    DOCS / "rx_recovery_waveform.png",
    dpi=180
)

plt.close()


print("Generated:")
print("docs/results/tx_differential_waveform.png")
print("docs/results/tx_vdiff.png")
print("docs/results/rx_recovery_waveform.png")