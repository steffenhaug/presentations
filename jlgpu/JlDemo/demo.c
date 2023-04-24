double dot(double *v, double *w, int N) {
    double vw = 0;
    for (int i = 0; i < N; i++) {
        vw += v[i] * w[i];
    }
    return vw;
}

void square(double *v, int N) {
    for (int i = 0; i < N; i++) {
        v[i] *= v[i];
    }
}
