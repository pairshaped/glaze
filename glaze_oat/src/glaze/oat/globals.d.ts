declare global {
  const ot: {
    toast(title: string, description: string, options: { variant: string; placement: string; duration: number }): void;
  };
}
export {};
