import numpy as np
import matplotlib.pyplot as plt
from pathlib import Path

BITRATE = 1e9
SPS = 64
NUM_BITS = 4096
V_HIGH = 0.5
V_LOW = -0.5

OUT = Path("docs/results")
OUT.mkdir(parents=True, exist_ok=True)

rng = np.random.default_rng(42)


def prbs7(n):
    state = 0b0000001
    bits = []

    for _ in range(n):
        bit = (state >> 6) & 1
        bits.append(bit)

        feedback = ((state >> 6) ^ (state >> 5)) & 1
        state = ((state << 1) & 0x7E) | feedback

    return np.array(bits)


def nrz(bits):
    levels = np.where(bits == 1, V_HIGH, V_LOW)
    return np.repeat(levels, SPS)


def lowpass(x, alpha=0.12):
    y = np.zeros_like(x, dtype=float)
    y[0] = x[0]

    for i in range(1, len(x)):
        y[i] = y[i - 1] + alpha * (x[i] - y[i - 1])

    return y


def draw_eye(signal, filename, title, jitter_samples=0):
    plt.figure(figsize=(8, 5))

    span = 2 * SPS

    for bit in range(2, NUM_BITS - 3):
        center = bit * SPS

        shift = 0
        if jitter_samples:
            shift = int(rng.normal(0, jitter_samples))

        start = center - SPS + shift
        end = start + span

        if start >= 0 and end < len(signal):
            segment = signal[start:end]

            t = np.linspace(-1, 1, len(segment))
            plt.plot(t, segment, alpha=0.08)

    plt.xlabel("Time (UI)")
    plt.ylabel("Voltage (V)")
    plt.title(title)
    plt.grid(True)
    plt.tight_layout()
    plt.savefig(OUT / filename, dpi=180)
    plt.close()


bits = prbs7(NUM_BITS)

clean = nrz(bits)

lossy = lowpass(clean, alpha=0.10)

noise = rng.normal(0, 0.08, len(lossy))
impaired = lossy + noise


draw_eye(
    clean,
    "eye_clean.png",
    "OpenSerDes-LP - Ideal Channel"
)

draw_eye(
    lossy,
    "eye_lossy.png",
    "OpenSerDes-LP - Bandwidth Limited Channel"
)

draw_eye(
    impaired,
    "eye_jitter_noise.png",
    "OpenSerDes-LP - Loss + Jitter + Noise",
    jitter_samples=5
)

print("Eye diagrams generated:")
print("docs/results/eye_clean.png")
print("docs/results/eye_lossy.png")
print("docs/results/eye_jitter_noise.png")