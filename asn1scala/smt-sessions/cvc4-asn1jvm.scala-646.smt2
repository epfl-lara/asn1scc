; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18062 () Bool)

(assert start!18062)

(declare-fun b!88974 () Bool)

(declare-fun res!73249 () Bool)

(declare-fun e!58820 () Bool)

(assert (=> b!88974 (=> (not res!73249) (not e!58820))))

(declare-datatypes ((array!4201 0))(
  ( (array!4202 (arr!2534 (Array (_ BitVec 32) (_ BitVec 8))) (size!1897 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3356 0))(
  ( (BitStream!3357 (buf!2287 array!4201) (currentByte!4529 (_ BitVec 32)) (currentBit!4524 (_ BitVec 32))) )
))
(declare-fun thiss!1151 () BitStream!3356)

(declare-fun nBits!336 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!88974 (= res!73249 (validate_offset_bits!1 ((_ sign_extend 32) (size!1897 (buf!2287 thiss!1151))) ((_ sign_extend 32) (currentByte!4529 thiss!1151)) ((_ sign_extend 32) (currentBit!4524 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!88976 () Bool)

(declare-fun res!73250 () Bool)

(assert (=> b!88976 (=> (not res!73250) (not e!58820))))

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!88976 (= res!73250 (bvslt i!576 nBits!336))))

(declare-fun b!88977 () Bool)

(declare-fun res!73247 () Bool)

(assert (=> b!88977 (=> (not res!73247) (not e!58820))))

(declare-fun thiss!1152 () BitStream!3356)

(assert (=> b!88977 (= res!73247 (and (bvsle i!576 nBits!336) (= (size!1897 (buf!2287 thiss!1152)) (size!1897 (buf!2287 thiss!1151)))))))

(declare-fun b!88978 () Bool)

(declare-fun res!73252 () Bool)

(assert (=> b!88978 (=> (not res!73252) (not e!58820))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!88978 (= res!73252 (invariant!0 (currentBit!4524 thiss!1152) (currentByte!4529 thiss!1152) (size!1897 (buf!2287 thiss!1152))))))

(declare-fun b!88979 () Bool)

(declare-fun e!58821 () Bool)

(declare-fun array_inv!1743 (array!4201) Bool)

(assert (=> b!88979 (= e!58821 (array_inv!1743 (buf!2287 thiss!1151)))))

(declare-fun b!88980 () Bool)

(declare-fun res!73253 () Bool)

(assert (=> b!88980 (=> (not res!73253) (not e!58820))))

(assert (=> b!88980 (= res!73253 (invariant!0 (currentBit!4524 thiss!1151) (currentByte!4529 thiss!1151) (size!1897 (buf!2287 thiss!1151))))))

(declare-fun b!88981 () Bool)

(declare-fun res!73248 () Bool)

(assert (=> b!88981 (=> (not res!73248) (not e!58820))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!88981 (= res!73248 (= (bitIndex!0 (size!1897 (buf!2287 thiss!1152)) (currentByte!4529 thiss!1152) (currentBit!4524 thiss!1152)) (bvadd (bitIndex!0 (size!1897 (buf!2287 thiss!1151)) (currentByte!4529 thiss!1151) (currentBit!4524 thiss!1151)) ((_ sign_extend 32) i!576))))))

(declare-fun b!88982 () Bool)

(declare-fun res!73251 () Bool)

(assert (=> b!88982 (=> (not res!73251) (not e!58820))))

(assert (=> b!88982 (= res!73251 (validate_offset_bits!1 ((_ sign_extend 32) (size!1897 (buf!2287 thiss!1152))) ((_ sign_extend 32) (currentByte!4529 thiss!1152)) ((_ sign_extend 32) (currentBit!4524 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun res!73255 () Bool)

(assert (=> start!18062 (=> (not res!73255) (not e!58820))))

(assert (=> start!18062 (= res!73255 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18062 e!58820))

(assert (=> start!18062 true))

(declare-fun inv!12 (BitStream!3356) Bool)

(assert (=> start!18062 (and (inv!12 thiss!1151) e!58821)))

(declare-fun e!58817 () Bool)

(assert (=> start!18062 (and (inv!12 thiss!1152) e!58817)))

(declare-fun b!88975 () Bool)

(declare-fun res!73254 () Bool)

(assert (=> b!88975 (=> (not res!73254) (not e!58820))))

(assert (=> b!88975 (= res!73254 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!88983 () Bool)

(assert (=> b!88983 (= e!58817 (array_inv!1743 (buf!2287 thiss!1152)))))

(declare-fun b!88984 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!88984 (= e!58820 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!1897 (buf!2287 thiss!1152))) ((_ sign_extend 32) (currentByte!4529 thiss!1152)) ((_ sign_extend 32) (currentBit!4524 thiss!1152)))))))

(assert (= (and start!18062 res!73255) b!88974))

(assert (= (and b!88974 res!73249) b!88980))

(assert (= (and b!88980 res!73253) b!88975))

(assert (= (and b!88975 res!73254) b!88978))

(assert (= (and b!88978 res!73252) b!88977))

(assert (= (and b!88977 res!73247) b!88981))

(assert (= (and b!88981 res!73248) b!88982))

(assert (= (and b!88982 res!73251) b!88976))

(assert (= (and b!88976 res!73250) b!88984))

(assert (= start!18062 b!88979))

(assert (= start!18062 b!88983))

(declare-fun m!133963 () Bool)

(assert (=> b!88974 m!133963))

(declare-fun m!133965 () Bool)

(assert (=> b!88978 m!133965))

(declare-fun m!133967 () Bool)

(assert (=> b!88980 m!133967))

(declare-fun m!133969 () Bool)

(assert (=> b!88981 m!133969))

(declare-fun m!133971 () Bool)

(assert (=> b!88981 m!133971))

(declare-fun m!133973 () Bool)

(assert (=> start!18062 m!133973))

(declare-fun m!133975 () Bool)

(assert (=> start!18062 m!133975))

(declare-fun m!133977 () Bool)

(assert (=> b!88984 m!133977))

(declare-fun m!133979 () Bool)

(assert (=> b!88983 m!133979))

(declare-fun m!133981 () Bool)

(assert (=> b!88979 m!133981))

(declare-fun m!133983 () Bool)

(assert (=> b!88982 m!133983))

(push 1)

(assert (not b!88981))

(assert (not b!88984))

(assert (not start!18062))

(assert (not b!88979))

(assert (not b!88983))

(assert (not b!88980))

(assert (not b!88978))

(assert (not b!88974))

(assert (not b!88982))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!27838 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!27838 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!1897 (buf!2287 thiss!1152))) ((_ sign_extend 32) (currentByte!4529 thiss!1152)) ((_ sign_extend 32) (currentBit!4524 thiss!1152))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1897 (buf!2287 thiss!1152))) ((_ sign_extend 32) (currentByte!4529 thiss!1152)) ((_ sign_extend 32) (currentBit!4524 thiss!1152))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!6904 () Bool)

(assert (= bs!6904 d!27838))

(declare-fun m!133985 () Bool)

(assert (=> bs!6904 m!133985))

(assert (=> b!88984 d!27838))

(declare-fun d!27848 () Bool)

(assert (=> d!27848 (= (array_inv!1743 (buf!2287 thiss!1151)) (bvsge (size!1897 (buf!2287 thiss!1151)) #b00000000000000000000000000000000))))

(assert (=> b!88979 d!27848))

(declare-fun d!27850 () Bool)

(assert (=> d!27850 (= (invariant!0 (currentBit!4524 thiss!1152) (currentByte!4529 thiss!1152) (size!1897 (buf!2287 thiss!1152))) (and (bvsge (currentBit!4524 thiss!1152) #b00000000000000000000000000000000) (bvslt (currentBit!4524 thiss!1152) #b00000000000000000000000000001000) (bvsge (currentByte!4529 thiss!1152) #b00000000000000000000000000000000) (or (bvslt (currentByte!4529 thiss!1152) (size!1897 (buf!2287 thiss!1152))) (and (= (currentBit!4524 thiss!1152) #b00000000000000000000000000000000) (= (currentByte!4529 thiss!1152) (size!1897 (buf!2287 thiss!1152)))))))))

(assert (=> b!88978 d!27850))

(declare-fun d!27856 () Bool)

(assert (=> d!27856 (= (inv!12 thiss!1151) (invariant!0 (currentBit!4524 thiss!1151) (currentByte!4529 thiss!1151) (size!1897 (buf!2287 thiss!1151))))))

(declare-fun bs!6906 () Bool)

(assert (= bs!6906 d!27856))

(assert (=> bs!6906 m!133967))

(assert (=> start!18062 d!27856))

(declare-fun d!27858 () Bool)

(assert (=> d!27858 (= (inv!12 thiss!1152) (invariant!0 (currentBit!4524 thiss!1152) (currentByte!4529 thiss!1152) (size!1897 (buf!2287 thiss!1152))))))

(declare-fun bs!6907 () Bool)

(assert (= bs!6907 d!27858))

(assert (=> bs!6907 m!133965))

(assert (=> start!18062 d!27858))

(declare-fun d!27860 () Bool)

(assert (=> d!27860 (= (array_inv!1743 (buf!2287 thiss!1152)) (bvsge (size!1897 (buf!2287 thiss!1152)) #b00000000000000000000000000000000))))

(assert (=> b!88983 d!27860))

(declare-fun d!27862 () Bool)

(assert (=> d!27862 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1897 (buf!2287 thiss!1152))) ((_ sign_extend 32) (currentByte!4529 thiss!1152)) ((_ sign_extend 32) (currentBit!4524 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1897 (buf!2287 thiss!1152))) ((_ sign_extend 32) (currentByte!4529 thiss!1152)) ((_ sign_extend 32) (currentBit!4524 thiss!1152))) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun bs!6908 () Bool)

(assert (= bs!6908 d!27862))

(assert (=> bs!6908 m!133985))

(assert (=> b!88982 d!27862))

(declare-fun d!27864 () Bool)

(declare-fun e!58828 () Bool)

(assert (=> d!27864 e!58828))

(declare-fun res!73269 () Bool)

(assert (=> d!27864 (=> (not res!73269) (not e!58828))))

(declare-fun lt!136324 () (_ BitVec 64))

(declare-fun lt!136322 () (_ BitVec 64))

(declare-fun lt!136323 () (_ BitVec 64))

(assert (=> d!27864 (= res!73269 (= lt!136323 (bvsub lt!136324 lt!136322)))))

(assert (=> d!27864 (or (= (bvand lt!136324 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136322 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!136324 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!136324 lt!136322) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27864 (= lt!136322 (remainingBits!0 ((_ sign_extend 32) (size!1897 (buf!2287 thiss!1152))) ((_ sign_extend 32) (currentByte!4529 thiss!1152)) ((_ sign_extend 32) (currentBit!4524 thiss!1152))))))

(declare-fun lt!136325 () (_ BitVec 64))

(declare-fun lt!136326 () (_ BitVec 64))

(assert (=> d!27864 (= lt!136324 (bvmul lt!136325 lt!136326))))

(assert (=> d!27864 (or (= lt!136325 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!136326 (bvsdiv (bvmul lt!136325 lt!136326) lt!136325)))))

(assert (=> d!27864 (= lt!136326 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27864 (= lt!136325 ((_ sign_extend 32) (size!1897 (buf!2287 thiss!1152))))))

(assert (=> d!27864 (= lt!136323 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4529 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4524 thiss!1152))))))

(assert (=> d!27864 (invariant!0 (currentBit!4524 thiss!1152) (currentByte!4529 thiss!1152) (size!1897 (buf!2287 thiss!1152)))))

(assert (=> d!27864 (= (bitIndex!0 (size!1897 (buf!2287 thiss!1152)) (currentByte!4529 thiss!1152) (currentBit!4524 thiss!1152)) lt!136323)))

(declare-fun b!88997 () Bool)

(declare-fun res!73268 () Bool)

(assert (=> b!88997 (=> (not res!73268) (not e!58828))))

(assert (=> b!88997 (= res!73268 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!136323))))

(declare-fun b!88998 () Bool)

(declare-fun lt!136321 () (_ BitVec 64))

(assert (=> b!88998 (= e!58828 (bvsle lt!136323 (bvmul lt!136321 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!88998 (or (= lt!136321 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!136321 #b0000000000000000000000000000000000000000000000000000000000001000) lt!136321)))))

(assert (=> b!88998 (= lt!136321 ((_ sign_extend 32) (size!1897 (buf!2287 thiss!1152))))))

(assert (= (and d!27864 res!73269) b!88997))

(assert (= (and b!88997 res!73268) b!88998))

(assert (=> d!27864 m!133985))

(assert (=> d!27864 m!133965))

(assert (=> b!88981 d!27864))

(declare-fun d!27876 () Bool)

(declare-fun e!58829 () Bool)

(assert (=> d!27876 e!58829))

(declare-fun res!73271 () Bool)

(assert (=> d!27876 (=> (not res!73271) (not e!58829))))

(declare-fun lt!136329 () (_ BitVec 64))

(declare-fun lt!136330 () (_ BitVec 64))

(declare-fun lt!136328 () (_ BitVec 64))

(assert (=> d!27876 (= res!73271 (= lt!136329 (bvsub lt!136330 lt!136328)))))

(assert (=> d!27876 (or (= (bvand lt!136330 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136328 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!136330 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!136330 lt!136328) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27876 (= lt!136328 (remainingBits!0 ((_ sign_extend 32) (size!1897 (buf!2287 thiss!1151))) ((_ sign_extend 32) (currentByte!4529 thiss!1151)) ((_ sign_extend 32) (currentBit!4524 thiss!1151))))))

(declare-fun lt!136331 () (_ BitVec 64))

(declare-fun lt!136332 () (_ BitVec 64))

(assert (=> d!27876 (= lt!136330 (bvmul lt!136331 lt!136332))))

(assert (=> d!27876 (or (= lt!136331 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!136332 (bvsdiv (bvmul lt!136331 lt!136332) lt!136331)))))

(assert (=> d!27876 (= lt!136332 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27876 (= lt!136331 ((_ sign_extend 32) (size!1897 (buf!2287 thiss!1151))))))

(assert (=> d!27876 (= lt!136329 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4529 thiss!1151)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4524 thiss!1151))))))

(assert (=> d!27876 (invariant!0 (currentBit!4524 thiss!1151) (currentByte!4529 thiss!1151) (size!1897 (buf!2287 thiss!1151)))))

(assert (=> d!27876 (= (bitIndex!0 (size!1897 (buf!2287 thiss!1151)) (currentByte!4529 thiss!1151) (currentBit!4524 thiss!1151)) lt!136329)))

(declare-fun b!88999 () Bool)

(declare-fun res!73270 () Bool)

(assert (=> b!88999 (=> (not res!73270) (not e!58829))))

(assert (=> b!88999 (= res!73270 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!136329))))

(declare-fun b!89000 () Bool)

(declare-fun lt!136327 () (_ BitVec 64))

(assert (=> b!89000 (= e!58829 (bvsle lt!136329 (bvmul lt!136327 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!89000 (or (= lt!136327 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!136327 #b0000000000000000000000000000000000000000000000000000000000001000) lt!136327)))))

(assert (=> b!89000 (= lt!136327 ((_ sign_extend 32) (size!1897 (buf!2287 thiss!1151))))))

(assert (= (and d!27876 res!73271) b!88999))

(assert (= (and b!88999 res!73270) b!89000))

(declare-fun m!133993 () Bool)

(assert (=> d!27876 m!133993))

(assert (=> d!27876 m!133967))

(assert (=> b!88981 d!27876))

(declare-fun d!27880 () Bool)

(assert (=> d!27880 (= (invariant!0 (currentBit!4524 thiss!1151) (currentByte!4529 thiss!1151) (size!1897 (buf!2287 thiss!1151))) (and (bvsge (currentBit!4524 thiss!1151) #b00000000000000000000000000000000) (bvslt (currentBit!4524 thiss!1151) #b00000000000000000000000000001000) (bvsge (currentByte!4529 thiss!1151) #b00000000000000000000000000000000) (or (bvslt (currentByte!4529 thiss!1151) (size!1897 (buf!2287 thiss!1151))) (and (= (currentBit!4524 thiss!1151) #b00000000000000000000000000000000) (= (currentByte!4529 thiss!1151) (size!1897 (buf!2287 thiss!1151)))))))))

(assert (=> b!88980 d!27880))

(declare-fun d!27882 () Bool)

(assert (=> d!27882 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1897 (buf!2287 thiss!1151))) ((_ sign_extend 32) (currentByte!4529 thiss!1151)) ((_ sign_extend 32) (currentBit!4524 thiss!1151)) ((_ sign_extend 32) nBits!336)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1897 (buf!2287 thiss!1151))) ((_ sign_extend 32) (currentByte!4529 thiss!1151)) ((_ sign_extend 32) (currentBit!4524 thiss!1151))) ((_ sign_extend 32) nBits!336)))))

(declare-fun bs!6912 () Bool)

(assert (= bs!6912 d!27882))

(assert (=> bs!6912 m!133993))

(assert (=> b!88974 d!27882))

(push 1)

(assert (not d!27862))

(assert (not d!27856))

(assert (not d!27858))

(assert (not d!27838))

(assert (not d!27882))

(assert (not d!27876))

(assert (not d!27864))

(check-sat)

(pop 1)

(push 1)

(check-sat)

