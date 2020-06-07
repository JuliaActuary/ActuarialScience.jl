# Experimental, transducers-based version of functions
using Transducers
qs = [0.00699000,0.00044700,0.00030100,0.00023300,0.00017700,0.00016100,0.00015000,0.00013900,0.00012300,0.00010500,0.00009100,0.00009600,0.00013500,0.00021700,0.00033200,0.00045600,0.00057900,0.00070900,0.00084300,0.00097700,0.00111800,0.00125000,0.00134200,0.00138200,0.00138200,0.00137000,0.00136400,0.00136200,0.00137300,0.00139300,0.00141900,0.00144500,0.00147800,0.00151900,0.00156900,0.00163100,0.00170900,0.00180700,0.00192700,0.00207000,0.00223400,0.00242000,0.00262800,0.00286000,0.00311700,0.00339600,0.00370300,0.00405100,0.00444400,0.00487800,0.00534700,0.00583800,0.00633700,0.00683700,0.00734700,0.00790500,0.00850800,0.00911600,0.00972300,0.01035400,0.01104600,0.01183500,0.01272800,0.01374300,0.01488500,0.01618200,0.01761200,0.01913800,0.02075200,0.02249700,0.02448800,0.02674700,0.02921200,0.03188500,0.03483200,0.03821700,0.04205900,0.04626100,0.05082600,0.05586500,0.06162000,0.06815300,0.07534900,0.08323000,0.09193300,0.10162500,0.11244800,0.12450200,0.13783700,0.15245800,0.16835200,0.18548600,0.20381700,0.22329800,0.24386700,0.26427700,0.28416800,0.30316400,0.32087600,0.33691900,0.35376500,0.37145400,0.39002600,0.40952800,0.43000400,0.45150400,0.47407900,0.49778300,0.52267300,0.54880600,0.57624600,0.60505900,0.63531200,0.66707700,0.70043100,0.73545300,0.77222500,0.81083700,0.85137800,0.89394700]

#l_vec = cumprod(1 .- [0.0; qs])
lxf = Map(x -> 1-x) |> Scan(*)
l = collect(lxf,[0;qs])
lf(collection,n) = foldl()

# d_vec = l_vec[1:end-1] .* qs
dxf = Zip(lxf,Map(identity)) |> MapSplat(*) 
d = collect(dxf, [0.0;qs]) # not quite right... vecs are off by one

Dxf = Enumerate() |> MapSplat((x,y) -> y * 1.05 ^-x)
D = collect(lxf |> Dxf,qs)