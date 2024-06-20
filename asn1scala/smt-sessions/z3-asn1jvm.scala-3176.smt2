; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73000 () Bool)

(assert start!73000)

(declare-fun b!324933 () Bool)

(declare-fun res!266669 () Bool)

(declare-fun e!234229 () Bool)

(assert (=> b!324933 (=> (not res!266669) (not e!234229))))

(declare-datatypes ((array!20935 0))(
  ( (array!20936 (arr!10187 (Array (_ BitVec 32) (_ BitVec 8))) (size!9095 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14352 0))(
  ( (BitStream!14353 (buf!8237 array!20935) (currentByte!15254 (_ BitVec 32)) (currentBit!15249 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14352)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!324933 (= res!266669 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9095 (buf!8237 thiss!877)) (currentByte!15254 thiss!877) (currentBit!15249 thiss!877))) (bitIndex!0 (size!9095 (buf!8237 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15254 thiss!877)) #b00000000000000000000000000000000)))))

(declare-fun b!324934 () Bool)

(declare-fun res!266668 () Bool)

(assert (=> b!324934 (=> (not res!266668) (not e!234229))))

(assert (=> b!324934 (= res!266668 (and (bvsle ((_ sign_extend 32) (size!9095 (buf!8237 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!15254 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!15249 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!9095 (buf!8237 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!15254 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!15249 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!266670 () Bool)

(assert (=> start!73000 (=> (not res!266670) (not e!234229))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73000 (= res!266670 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9095 (buf!8237 thiss!877))) ((_ sign_extend 32) (currentByte!15254 thiss!877)) ((_ sign_extend 32) (currentBit!15249 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!73000 e!234229))

(declare-fun e!234230 () Bool)

(declare-fun inv!12 (BitStream!14352) Bool)

(assert (=> start!73000 (and (inv!12 thiss!877) e!234230)))

(declare-fun b!324935 () Bool)

(declare-fun res!266671 () Bool)

(assert (=> b!324935 (=> (not res!266671) (not e!234229))))

(assert (=> b!324935 (= res!266671 (bvsge (currentBit!15249 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!324936 () Bool)

(declare-fun array_inv!8647 (array!20935) Bool)

(assert (=> b!324936 (= e!234230 (array_inv!8647 (buf!8237 thiss!877)))))

(declare-fun b!324937 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!324937 (= e!234229 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15249 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15254 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9095 (buf!8237 thiss!877)))))))))

(assert (= (and start!73000 res!266670) b!324935))

(assert (= (and b!324935 res!266671) b!324933))

(assert (= (and b!324933 res!266669) b!324934))

(assert (= (and b!324934 res!266668) b!324937))

(assert (= start!73000 b!324936))

(declare-fun m!462967 () Bool)

(assert (=> b!324933 m!462967))

(declare-fun m!462969 () Bool)

(assert (=> b!324933 m!462969))

(declare-fun m!462971 () Bool)

(assert (=> start!73000 m!462971))

(declare-fun m!462973 () Bool)

(assert (=> start!73000 m!462973))

(declare-fun m!462975 () Bool)

(assert (=> b!324936 m!462975))

(declare-fun m!462977 () Bool)

(assert (=> b!324937 m!462977))

(check-sat (not b!324933) (not start!73000) (not b!324936) (not b!324937))
(check-sat)
(get-model)

(declare-fun d!106922 () Bool)

(declare-fun e!234243 () Bool)

(assert (=> d!106922 e!234243))

(declare-fun res!266688 () Bool)

(assert (=> d!106922 (=> (not res!266688) (not e!234243))))

(declare-fun lt!447361 () (_ BitVec 64))

(declare-fun lt!447362 () (_ BitVec 64))

(declare-fun lt!447360 () (_ BitVec 64))

(assert (=> d!106922 (= res!266688 (= lt!447360 (bvsub lt!447361 lt!447362)))))

(assert (=> d!106922 (or (= (bvand lt!447361 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447362 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447361 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447361 lt!447362) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106922 (= lt!447362 (remainingBits!0 ((_ sign_extend 32) (size!9095 (buf!8237 thiss!877))) ((_ sign_extend 32) (currentByte!15254 thiss!877)) ((_ sign_extend 32) (currentBit!15249 thiss!877))))))

(declare-fun lt!447357 () (_ BitVec 64))

(declare-fun lt!447359 () (_ BitVec 64))

(assert (=> d!106922 (= lt!447361 (bvmul lt!447357 lt!447359))))

(assert (=> d!106922 (or (= lt!447357 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447359 (bvsdiv (bvmul lt!447357 lt!447359) lt!447357)))))

(assert (=> d!106922 (= lt!447359 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106922 (= lt!447357 ((_ sign_extend 32) (size!9095 (buf!8237 thiss!877))))))

(assert (=> d!106922 (= lt!447360 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15254 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15249 thiss!877))))))

(assert (=> d!106922 (invariant!0 (currentBit!15249 thiss!877) (currentByte!15254 thiss!877) (size!9095 (buf!8237 thiss!877)))))

(assert (=> d!106922 (= (bitIndex!0 (size!9095 (buf!8237 thiss!877)) (currentByte!15254 thiss!877) (currentBit!15249 thiss!877)) lt!447360)))

(declare-fun b!324957 () Bool)

(declare-fun res!266689 () Bool)

(assert (=> b!324957 (=> (not res!266689) (not e!234243))))

(assert (=> b!324957 (= res!266689 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447360))))

(declare-fun b!324958 () Bool)

(declare-fun lt!447358 () (_ BitVec 64))

(assert (=> b!324958 (= e!234243 (bvsle lt!447360 (bvmul lt!447358 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324958 (or (= lt!447358 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447358 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447358)))))

(assert (=> b!324958 (= lt!447358 ((_ sign_extend 32) (size!9095 (buf!8237 thiss!877))))))

(assert (= (and d!106922 res!266688) b!324957))

(assert (= (and b!324957 res!266689) b!324958))

(assert (=> d!106922 m!462971))

(declare-fun m!462991 () Bool)

(assert (=> d!106922 m!462991))

(assert (=> b!324933 d!106922))

(declare-fun d!106928 () Bool)

(declare-fun e!234244 () Bool)

(assert (=> d!106928 e!234244))

(declare-fun res!266690 () Bool)

(assert (=> d!106928 (=> (not res!266690) (not e!234244))))

(declare-fun lt!447366 () (_ BitVec 64))

(declare-fun lt!447367 () (_ BitVec 64))

(declare-fun lt!447368 () (_ BitVec 64))

(assert (=> d!106928 (= res!266690 (= lt!447366 (bvsub lt!447367 lt!447368)))))

(assert (=> d!106928 (or (= (bvand lt!447367 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447368 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447367 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447367 lt!447368) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106928 (= lt!447368 (remainingBits!0 ((_ sign_extend 32) (size!9095 (buf!8237 thiss!877))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15254 thiss!877))) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun lt!447363 () (_ BitVec 64))

(declare-fun lt!447365 () (_ BitVec 64))

(assert (=> d!106928 (= lt!447367 (bvmul lt!447363 lt!447365))))

(assert (=> d!106928 (or (= lt!447363 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447365 (bvsdiv (bvmul lt!447363 lt!447365) lt!447363)))))

(assert (=> d!106928 (= lt!447365 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106928 (= lt!447363 ((_ sign_extend 32) (size!9095 (buf!8237 thiss!877))))))

(assert (=> d!106928 (= lt!447366 (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15254 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(assert (=> d!106928 (invariant!0 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!15254 thiss!877)) (size!9095 (buf!8237 thiss!877)))))

(assert (=> d!106928 (= (bitIndex!0 (size!9095 (buf!8237 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15254 thiss!877)) #b00000000000000000000000000000000) lt!447366)))

(declare-fun b!324959 () Bool)

(declare-fun res!266691 () Bool)

(assert (=> b!324959 (=> (not res!266691) (not e!234244))))

(assert (=> b!324959 (= res!266691 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447366))))

(declare-fun b!324960 () Bool)

(declare-fun lt!447364 () (_ BitVec 64))

(assert (=> b!324960 (= e!234244 (bvsle lt!447366 (bvmul lt!447364 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324960 (or (= lt!447364 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447364 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447364)))))

(assert (=> b!324960 (= lt!447364 ((_ sign_extend 32) (size!9095 (buf!8237 thiss!877))))))

(assert (= (and d!106928 res!266690) b!324959))

(assert (= (and b!324959 res!266691) b!324960))

(declare-fun m!462993 () Bool)

(assert (=> d!106928 m!462993))

(declare-fun m!462995 () Bool)

(assert (=> d!106928 m!462995))

(assert (=> b!324933 d!106928))

(declare-fun d!106930 () Bool)

(assert (=> d!106930 (= (remainingBits!0 ((_ sign_extend 32) (size!9095 (buf!8237 thiss!877))) ((_ sign_extend 32) (currentByte!15254 thiss!877)) ((_ sign_extend 32) (currentBit!15249 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9095 (buf!8237 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15254 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15249 thiss!877)))))))

(assert (=> start!73000 d!106930))

(declare-fun d!106932 () Bool)

(assert (=> d!106932 (= (inv!12 thiss!877) (invariant!0 (currentBit!15249 thiss!877) (currentByte!15254 thiss!877) (size!9095 (buf!8237 thiss!877))))))

(declare-fun bs!28151 () Bool)

(assert (= bs!28151 d!106932))

(assert (=> bs!28151 m!462991))

(assert (=> start!73000 d!106932))

(declare-fun d!106934 () Bool)

(assert (=> d!106934 (= (array_inv!8647 (buf!8237 thiss!877)) (bvsge (size!9095 (buf!8237 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!324936 d!106934))

(declare-fun d!106938 () Bool)

(assert (=> d!106938 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15249 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15254 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9095 (buf!8237 thiss!877))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15249 thiss!877))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15249 thiss!877))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15254 thiss!877))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15254 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9095 (buf!8237 thiss!877))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15249 thiss!877))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15254 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9095 (buf!8237 thiss!877)))))))))))

(assert (=> b!324937 d!106938))

(check-sat (not d!106928) (not d!106922) (not d!106932))
