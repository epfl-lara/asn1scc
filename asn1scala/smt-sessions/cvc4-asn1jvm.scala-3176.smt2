; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73002 () Bool)

(assert start!73002)

(declare-fun b!324948 () Bool)

(declare-fun res!266681 () Bool)

(declare-fun e!234239 () Bool)

(assert (=> b!324948 (=> (not res!266681) (not e!234239))))

(declare-datatypes ((array!20937 0))(
  ( (array!20938 (arr!10188 (Array (_ BitVec 32) (_ BitVec 8))) (size!9096 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14354 0))(
  ( (BitStream!14355 (buf!8238 array!20937) (currentByte!15255 (_ BitVec 32)) (currentBit!15250 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14354)

(assert (=> b!324948 (= res!266681 (and (bvsle ((_ sign_extend 32) (size!9096 (buf!8238 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!15255 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!15250 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!9096 (buf!8238 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!15255 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!15250 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!266680 () Bool)

(assert (=> start!73002 (=> (not res!266680) (not e!234239))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73002 (= res!266680 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9096 (buf!8238 thiss!877))) ((_ sign_extend 32) (currentByte!15255 thiss!877)) ((_ sign_extend 32) (currentBit!15250 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!73002 e!234239))

(declare-fun e!234240 () Bool)

(declare-fun inv!12 (BitStream!14354) Bool)

(assert (=> start!73002 (and (inv!12 thiss!877) e!234240)))

(declare-fun b!324949 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!324949 (= e!234239 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15250 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15255 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9096 (buf!8238 thiss!877)))))))))

(declare-fun b!324950 () Bool)

(declare-fun res!266683 () Bool)

(assert (=> b!324950 (=> (not res!266683) (not e!234239))))

(assert (=> b!324950 (= res!266683 (bvsge (currentBit!15250 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!324951 () Bool)

(declare-fun res!266682 () Bool)

(assert (=> b!324951 (=> (not res!266682) (not e!234239))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!324951 (= res!266682 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9096 (buf!8238 thiss!877)) (currentByte!15255 thiss!877) (currentBit!15250 thiss!877))) (bitIndex!0 (size!9096 (buf!8238 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15255 thiss!877)) #b00000000000000000000000000000000)))))

(declare-fun b!324952 () Bool)

(declare-fun array_inv!8648 (array!20937) Bool)

(assert (=> b!324952 (= e!234240 (array_inv!8648 (buf!8238 thiss!877)))))

(assert (= (and start!73002 res!266680) b!324950))

(assert (= (and b!324950 res!266683) b!324951))

(assert (= (and b!324951 res!266682) b!324948))

(assert (= (and b!324948 res!266681) b!324949))

(assert (= start!73002 b!324952))

(declare-fun m!462979 () Bool)

(assert (=> start!73002 m!462979))

(declare-fun m!462981 () Bool)

(assert (=> start!73002 m!462981))

(declare-fun m!462983 () Bool)

(assert (=> b!324949 m!462983))

(declare-fun m!462985 () Bool)

(assert (=> b!324951 m!462985))

(declare-fun m!462987 () Bool)

(assert (=> b!324951 m!462987))

(declare-fun m!462989 () Bool)

(assert (=> b!324952 m!462989))

(push 1)

(assert (not b!324952))

(assert (not start!73002))

(assert (not b!324949))

(assert (not b!324951))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106936 () Bool)

(assert (=> d!106936 (= (array_inv!8648 (buf!8238 thiss!877)) (bvsge (size!9096 (buf!8238 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!324952 d!106936))

(declare-fun d!106940 () Bool)

(assert (=> d!106940 (= (remainingBits!0 ((_ sign_extend 32) (size!9096 (buf!8238 thiss!877))) ((_ sign_extend 32) (currentByte!15255 thiss!877)) ((_ sign_extend 32) (currentBit!15250 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9096 (buf!8238 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15255 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15250 thiss!877)))))))

(assert (=> start!73002 d!106940))

(declare-fun d!106942 () Bool)

(assert (=> d!106942 (= (inv!12 thiss!877) (invariant!0 (currentBit!15250 thiss!877) (currentByte!15255 thiss!877) (size!9096 (buf!8238 thiss!877))))))

(declare-fun bs!28152 () Bool)

(assert (= bs!28152 d!106942))

(declare-fun m!462997 () Bool)

(assert (=> bs!28152 m!462997))

(assert (=> start!73002 d!106942))

(declare-fun d!106944 () Bool)

(assert (=> d!106944 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15250 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15255 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9096 (buf!8238 thiss!877))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15250 thiss!877))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15250 thiss!877))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15255 thiss!877))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15255 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9096 (buf!8238 thiss!877))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15250 thiss!877))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15255 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9096 (buf!8238 thiss!877)))))))))))

(assert (=> b!324949 d!106944))

(declare-fun d!106946 () Bool)

(declare-fun e!234251 () Bool)

(assert (=> d!106946 e!234251))

(declare-fun res!266705 () Bool)

(assert (=> d!106946 (=> (not res!266705) (not e!234251))))

(declare-fun lt!447407 () (_ BitVec 64))

(declare-fun lt!447409 () (_ BitVec 64))

(declare-fun lt!447408 () (_ BitVec 64))

(assert (=> d!106946 (= res!266705 (= lt!447408 (bvsub lt!447409 lt!447407)))))

(assert (=> d!106946 (or (= (bvand lt!447409 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447407 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447409 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447409 lt!447407) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106946 (= lt!447407 (remainingBits!0 ((_ sign_extend 32) (size!9096 (buf!8238 thiss!877))) ((_ sign_extend 32) (currentByte!15255 thiss!877)) ((_ sign_extend 32) (currentBit!15250 thiss!877))))))

(declare-fun lt!447406 () (_ BitVec 64))

(declare-fun lt!447410 () (_ BitVec 64))

(assert (=> d!106946 (= lt!447409 (bvmul lt!447406 lt!447410))))

(assert (=> d!106946 (or (= lt!447406 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447410 (bvsdiv (bvmul lt!447406 lt!447410) lt!447406)))))

(assert (=> d!106946 (= lt!447410 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106946 (= lt!447406 ((_ sign_extend 32) (size!9096 (buf!8238 thiss!877))))))

(assert (=> d!106946 (= lt!447408 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15255 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15250 thiss!877))))))

(assert (=> d!106946 (invariant!0 (currentBit!15250 thiss!877) (currentByte!15255 thiss!877) (size!9096 (buf!8238 thiss!877)))))

(assert (=> d!106946 (= (bitIndex!0 (size!9096 (buf!8238 thiss!877)) (currentByte!15255 thiss!877) (currentBit!15250 thiss!877)) lt!447408)))

(declare-fun b!324973 () Bool)

(declare-fun res!266704 () Bool)

(assert (=> b!324973 (=> (not res!266704) (not e!234251))))

(assert (=> b!324973 (= res!266704 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447408))))

(declare-fun b!324974 () Bool)

(declare-fun lt!447405 () (_ BitVec 64))

(assert (=> b!324974 (= e!234251 (bvsle lt!447408 (bvmul lt!447405 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324974 (or (= lt!447405 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447405 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447405)))))

(assert (=> b!324974 (= lt!447405 ((_ sign_extend 32) (size!9096 (buf!8238 thiss!877))))))

(assert (= (and d!106946 res!266705) b!324973))

(assert (= (and b!324973 res!266704) b!324974))

(assert (=> d!106946 m!462979))

(assert (=> d!106946 m!462997))

(assert (=> b!324951 d!106946))

(declare-fun d!106956 () Bool)

(declare-fun e!234252 () Bool)

(assert (=> d!106956 e!234252))

(declare-fun res!266707 () Bool)

(assert (=> d!106956 (=> (not res!266707) (not e!234252))))

(declare-fun lt!447414 () (_ BitVec 64))

(declare-fun lt!447413 () (_ BitVec 64))

(declare-fun lt!447415 () (_ BitVec 64))

(assert (=> d!106956 (= res!266707 (= lt!447414 (bvsub lt!447415 lt!447413)))))

(assert (=> d!106956 (or (= (bvand lt!447415 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447413 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447415 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447415 lt!447413) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106956 (= lt!447413 (remainingBits!0 ((_ sign_extend 32) (size!9096 (buf!8238 thiss!877))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15255 thiss!877))) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun lt!447412 () (_ BitVec 64))

(declare-fun lt!447416 () (_ BitVec 64))

(assert (=> d!106956 (= lt!447415 (bvmul lt!447412 lt!447416))))

(assert (=> d!106956 (or (= lt!447412 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447416 (bvsdiv (bvmul lt!447412 lt!447416) lt!447412)))))

(assert (=> d!106956 (= lt!447416 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106956 (= lt!447412 ((_ sign_extend 32) (size!9096 (buf!8238 thiss!877))))))

(assert (=> d!106956 (= lt!447414 (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15255 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(assert (=> d!106956 (invariant!0 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!15255 thiss!877)) (size!9096 (buf!8238 thiss!877)))))

(assert (=> d!106956 (= (bitIndex!0 (size!9096 (buf!8238 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15255 thiss!877)) #b00000000000000000000000000000000) lt!447414)))

(declare-fun b!324975 () Bool)

(declare-fun res!266706 () Bool)

(assert (=> b!324975 (=> (not res!266706) (not e!234252))))

(assert (=> b!324975 (= res!266706 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447414))))

(declare-fun b!324976 () Bool)

(declare-fun lt!447411 () (_ BitVec 64))

(assert (=> b!324976 (= e!234252 (bvsle lt!447414 (bvmul lt!447411 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324976 (or (= lt!447411 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447411 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447411)))))

