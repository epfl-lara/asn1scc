; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73326 () Bool)

(assert start!73326)

(declare-fun res!267064 () Bool)

(declare-fun e!234676 () Bool)

(assert (=> start!73326 (=> (not res!267064) (not e!234676))))

(declare-datatypes ((array!21045 0))(
  ( (array!21046 (arr!10227 (Array (_ BitVec 32) (_ BitVec 8))) (size!9135 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14432 0))(
  ( (BitStream!14433 (buf!8277 array!21045) (currentByte!15357 (_ BitVec 32)) (currentBit!15352 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14432)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73326 (= res!267064 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9135 (buf!8277 thiss!877))) ((_ sign_extend 32) (currentByte!15357 thiss!877)) ((_ sign_extend 32) (currentBit!15352 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!73326 e!234676))

(declare-fun e!234677 () Bool)

(declare-fun inv!12 (BitStream!14432) Bool)

(assert (=> start!73326 (and (inv!12 thiss!877) e!234677)))

(declare-fun b!325448 () Bool)

(declare-fun res!267063 () Bool)

(assert (=> b!325448 (=> (not res!267063) (not e!234676))))

(assert (=> b!325448 (= res!267063 (bvsge (currentBit!15352 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!325449 () Bool)

(declare-fun lt!447847 () (_ BitVec 64))

(declare-fun lt!447848 () (_ BitVec 64))

(assert (=> b!325449 (= e!234676 (and (= lt!447847 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= lt!447847 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!447848) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!325449 (= lt!447847 (bvand lt!447848 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!325449 (= lt!447848 (bitIndex!0 (size!9135 (buf!8277 thiss!877)) (currentByte!15357 thiss!877) (currentBit!15352 thiss!877)))))

(declare-fun b!325450 () Bool)

(declare-fun array_inv!8687 (array!21045) Bool)

(assert (=> b!325450 (= e!234677 (array_inv!8687 (buf!8277 thiss!877)))))

(assert (= (and start!73326 res!267064) b!325448))

(assert (= (and b!325448 res!267063) b!325449))

(assert (= start!73326 b!325450))

(declare-fun m!463451 () Bool)

(assert (=> start!73326 m!463451))

(declare-fun m!463453 () Bool)

(assert (=> start!73326 m!463453))

(declare-fun m!463455 () Bool)

(assert (=> b!325449 m!463455))

(declare-fun m!463457 () Bool)

(assert (=> b!325450 m!463457))

(push 1)

(assert (not start!73326))

(assert (not b!325450))

(assert (not b!325449))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107280 () Bool)

(assert (=> d!107280 (= (remainingBits!0 ((_ sign_extend 32) (size!9135 (buf!8277 thiss!877))) ((_ sign_extend 32) (currentByte!15357 thiss!877)) ((_ sign_extend 32) (currentBit!15352 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9135 (buf!8277 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15357 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15352 thiss!877)))))))

(assert (=> start!73326 d!107280))

(declare-fun d!107282 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!107282 (= (inv!12 thiss!877) (invariant!0 (currentBit!15352 thiss!877) (currentByte!15357 thiss!877) (size!9135 (buf!8277 thiss!877))))))

(declare-fun bs!28230 () Bool)

(assert (= bs!28230 d!107282))

(declare-fun m!463461 () Bool)

(assert (=> bs!28230 m!463461))

(assert (=> start!73326 d!107282))

(declare-fun d!107284 () Bool)

(assert (=> d!107284 (= (array_inv!8687 (buf!8277 thiss!877)) (bvsge (size!9135 (buf!8277 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!325450 d!107284))

(declare-fun d!107286 () Bool)

(declare-fun e!234687 () Bool)

(assert (=> d!107286 e!234687))

(declare-fun res!267082 () Bool)

(assert (=> d!107286 (=> (not res!267082) (not e!234687))))

(declare-fun lt!447897 () (_ BitVec 64))

(declare-fun lt!447899 () (_ BitVec 64))

(declare-fun lt!447898 () (_ BitVec 64))

(assert (=> d!107286 (= res!267082 (= lt!447899 (bvsub lt!447898 lt!447897)))))

(assert (=> d!107286 (or (= (bvand lt!447898 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447897 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447898 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447898 lt!447897) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107286 (= lt!447897 (remainingBits!0 ((_ sign_extend 32) (size!9135 (buf!8277 thiss!877))) ((_ sign_extend 32) (currentByte!15357 thiss!877)) ((_ sign_extend 32) (currentBit!15352 thiss!877))))))

(declare-fun lt!447901 () (_ BitVec 64))

(declare-fun lt!447900 () (_ BitVec 64))

(assert (=> d!107286 (= lt!447898 (bvmul lt!447901 lt!447900))))

(assert (=> d!107286 (or (= lt!447901 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447900 (bvsdiv (bvmul lt!447901 lt!447900) lt!447901)))))

(assert (=> d!107286 (= lt!447900 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!107286 (= lt!447901 ((_ sign_extend 32) (size!9135 (buf!8277 thiss!877))))))

(assert (=> d!107286 (= lt!447899 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15357 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15352 thiss!877))))))

(assert (=> d!107286 (invariant!0 (currentBit!15352 thiss!877) (currentByte!15357 thiss!877) (size!9135 (buf!8277 thiss!877)))))

(assert (=> d!107286 (= (bitIndex!0 (size!9135 (buf!8277 thiss!877)) (currentByte!15357 thiss!877) (currentBit!15352 thiss!877)) lt!447899)))

(declare-fun b!325467 () Bool)

(declare-fun res!267081 () Bool)

(assert (=> b!325467 (=> (not res!267081) (not e!234687))))

(assert (=> b!325467 (= res!267081 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447899))))

(declare-fun b!325468 () Bool)

(declare-fun lt!447902 () (_ BitVec 64))

(assert (=> b!325468 (= e!234687 (bvsle lt!447899 (bvmul lt!447902 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325468 (or (= lt!447902 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447902 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447902)))))

(assert (=> b!325468 (= lt!447902 ((_ sign_extend 32) (size!9135 (buf!8277 thiss!877))))))

(assert (= (and d!107286 res!267082) b!325467))

(assert (= (and b!325467 res!267081) b!325468))

(assert (=> d!107286 m!463451))

(assert (=> d!107286 m!463461))

(assert (=> b!325449 d!107286))

(push 1)

(assert (not d!107286))

(assert (not d!107282))

(check-sat)

(pop 1)

(push 1)

(check-sat)

