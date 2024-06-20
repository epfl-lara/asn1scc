; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73178 () Bool)

(assert start!73178)

(declare-fun res!266922 () Bool)

(declare-fun e!234490 () Bool)

(assert (=> start!73178 (=> (not res!266922) (not e!234490))))

(declare-fun lt!447657 () (_ BitVec 64))

(declare-datatypes ((array!20996 0))(
  ( (array!20997 (arr!10210 (Array (_ BitVec 32) (_ BitVec 8))) (size!9118 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14398 0))(
  ( (BitStream!14399 (buf!8260 array!20996) (currentByte!15313 (_ BitVec 32)) (currentBit!15308 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14398)

(assert (=> start!73178 (= res!266922 (and (bvsgt lt!447657 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt (currentBit!15308 thiss!877) #b00000000000000000000000000000111)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73178 (= lt!447657 (remainingBits!0 ((_ sign_extend 32) (size!9118 (buf!8260 thiss!877))) ((_ sign_extend 32) (currentByte!15313 thiss!877)) ((_ sign_extend 32) (currentBit!15308 thiss!877))))))

(assert (=> start!73178 e!234490))

(declare-fun e!234491 () Bool)

(declare-fun inv!12 (BitStream!14398) Bool)

(assert (=> start!73178 (and (inv!12 thiss!877) e!234491)))

(declare-fun b!325256 () Bool)

(declare-fun res!266923 () Bool)

(assert (=> b!325256 (=> (not res!266923) (not e!234490))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!325256 (= res!266923 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9118 (buf!8260 thiss!877)) (currentByte!15313 thiss!877) (currentBit!15308 thiss!877))) (bitIndex!0 (size!9118 (buf!8260 thiss!877)) (currentByte!15313 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15308 thiss!877)))))))

(declare-fun b!325257 () Bool)

(declare-fun lt!447658 () (_ BitVec 64))

(declare-fun lt!447659 () (_ BitVec 64))

(assert (=> b!325257 (= e!234490 (and (not (= lt!447658 (bvand lt!447659 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= lt!447658 (bvand (bvsub lt!447657 lt!447659) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!325257 (= lt!447658 (bvand lt!447657 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325257 (= lt!447659 (remainingBits!0 ((_ sign_extend 32) (size!9118 (buf!8260 thiss!877))) ((_ sign_extend 32) (currentByte!15313 thiss!877)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15308 thiss!877)))))))

(declare-fun b!325258 () Bool)

(declare-fun array_inv!8670 (array!20996) Bool)

(assert (=> b!325258 (= e!234491 (array_inv!8670 (buf!8260 thiss!877)))))

(assert (= (and start!73178 res!266922) b!325256))

(assert (= (and b!325256 res!266923) b!325257))

(assert (= start!73178 b!325258))

(declare-fun m!463243 () Bool)

(assert (=> start!73178 m!463243))

(declare-fun m!463245 () Bool)

(assert (=> start!73178 m!463245))

(declare-fun m!463247 () Bool)

(assert (=> b!325256 m!463247))

(declare-fun m!463249 () Bool)

(assert (=> b!325256 m!463249))

(declare-fun m!463251 () Bool)

(assert (=> b!325257 m!463251))

(declare-fun m!463253 () Bool)

(assert (=> b!325258 m!463253))

(push 1)

(assert (not b!325256))

(assert (not start!73178))

(assert (not b!325257))

(assert (not b!325258))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107102 () Bool)

(declare-fun e!234517 () Bool)

(assert (=> d!107102 e!234517))

(declare-fun res!266949 () Bool)

(assert (=> d!107102 (=> (not res!266949) (not e!234517))))

(declare-fun lt!447716 () (_ BitVec 64))

(declare-fun lt!447719 () (_ BitVec 64))

(declare-fun lt!447714 () (_ BitVec 64))

(assert (=> d!107102 (= res!266949 (= lt!447714 (bvsub lt!447716 lt!447719)))))

(assert (=> d!107102 (or (= (bvand lt!447716 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447719 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447716 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447716 lt!447719) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107102 (= lt!447719 (remainingBits!0 ((_ sign_extend 32) (size!9118 (buf!8260 thiss!877))) ((_ sign_extend 32) (currentByte!15313 thiss!877)) ((_ sign_extend 32) (currentBit!15308 thiss!877))))))

(declare-fun lt!447717 () (_ BitVec 64))

(declare-fun lt!447718 () (_ BitVec 64))

(assert (=> d!107102 (= lt!447716 (bvmul lt!447717 lt!447718))))

(assert (=> d!107102 (or (= lt!447717 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447718 (bvsdiv (bvmul lt!447717 lt!447718) lt!447717)))))

(assert (=> d!107102 (= lt!447718 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!107102 (= lt!447717 ((_ sign_extend 32) (size!9118 (buf!8260 thiss!877))))))

(assert (=> d!107102 (= lt!447714 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15313 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15308 thiss!877))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!107102 (invariant!0 (currentBit!15308 thiss!877) (currentByte!15313 thiss!877) (size!9118 (buf!8260 thiss!877)))))

(assert (=> d!107102 (= (bitIndex!0 (size!9118 (buf!8260 thiss!877)) (currentByte!15313 thiss!877) (currentBit!15308 thiss!877)) lt!447714)))

(declare-fun b!325289 () Bool)

(declare-fun res!266948 () Bool)

(assert (=> b!325289 (=> (not res!266948) (not e!234517))))

(assert (=> b!325289 (= res!266948 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447714))))

(declare-fun b!325290 () Bool)

(declare-fun lt!447715 () (_ BitVec 64))

(assert (=> b!325290 (= e!234517 (bvsle lt!447714 (bvmul lt!447715 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325290 (or (= lt!447715 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447715 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447715)))))

(assert (=> b!325290 (= lt!447715 ((_ sign_extend 32) (size!9118 (buf!8260 thiss!877))))))

(assert (= (and d!107102 res!266949) b!325289))

(assert (= (and b!325289 res!266948) b!325290))

(assert (=> d!107102 m!463243))

(declare-fun m!463285 () Bool)

(assert (=> d!107102 m!463285))

(assert (=> b!325256 d!107102))

(declare-fun d!107124 () Bool)

(declare-fun e!234518 () Bool)

(assert (=> d!107124 e!234518))

(declare-fun res!266951 () Bool)

(assert (=> d!107124 (=> (not res!266951) (not e!234518))))

(declare-fun lt!447722 () (_ BitVec 64))

(declare-fun lt!447725 () (_ BitVec 64))

(declare-fun lt!447720 () (_ BitVec 64))

(assert (=> d!107124 (= res!266951 (= lt!447720 (bvsub lt!447722 lt!447725)))))

(assert (=> d!107124 (or (= (bvand lt!447722 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447725 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447722 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447722 lt!447725) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107124 (= lt!447725 (remainingBits!0 ((_ sign_extend 32) (size!9118 (buf!8260 thiss!877))) ((_ sign_extend 32) (currentByte!15313 thiss!877)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15308 thiss!877)))))))

(declare-fun lt!447723 () (_ BitVec 64))

(declare-fun lt!447724 () (_ BitVec 64))

(assert (=> d!107124 (= lt!447722 (bvmul lt!447723 lt!447724))))

(assert (=> d!107124 (or (= lt!447723 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447724 (bvsdiv (bvmul lt!447723 lt!447724) lt!447723)))))

(assert (=> d!107124 (= lt!447724 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!107124 (= lt!447723 ((_ sign_extend 32) (size!9118 (buf!8260 thiss!877))))))

(assert (=> d!107124 (= lt!447720 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15313 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15308 thiss!877)))))))

(assert (=> d!107124 (invariant!0 (bvadd #b00000000000000000000000000000001 (currentBit!15308 thiss!877)) (currentByte!15313 thiss!877) (size!9118 (buf!8260 thiss!877)))))

(assert (=> d!107124 (= (bitIndex!0 (size!9118 (buf!8260 thiss!877)) (currentByte!15313 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15308 thiss!877))) lt!447720)))

(declare-fun b!325291 () Bool)

(declare-fun res!266950 () Bool)

(assert (=> b!325291 (=> (not res!266950) (not e!234518))))

(assert (=> b!325291 (= res!266950 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447720))))

(declare-fun b!325292 () Bool)

(declare-fun lt!447721 () (_ BitVec 64))

(assert (=> b!325292 (= e!234518 (bvsle lt!447720 (bvmul lt!447721 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325292 (or (= lt!447721 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447721 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447721)))))

(assert (=> b!325292 (= lt!447721 ((_ sign_extend 32) (size!9118 (buf!8260 thiss!877))))))

(assert (= (and d!107124 res!266951) b!325291))

(assert (= (and b!325291 res!266950) b!325292))

(assert (=> d!107124 m!463251))

(declare-fun m!463287 () Bool)

(assert (=> d!107124 m!463287))

(assert (=> b!325256 d!107124))

(declare-fun d!107126 () Bool)

(assert (=> d!107126 (= (remainingBits!0 ((_ sign_extend 32) (size!9118 (buf!8260 thiss!877))) ((_ sign_extend 32) (currentByte!15313 thiss!877)) ((_ sign_extend 32) (currentBit!15308 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9118 (buf!8260 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15313 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15308 thiss!877)))))))

(assert (=> start!73178 d!107126))

(declare-fun d!107128 () Bool)

(assert (=> d!107128 (= (inv!12 thiss!877) (invariant!0 (currentBit!15308 thiss!877) (currentByte!15313 thiss!877) (size!9118 (buf!8260 thiss!877))))))

(declare-fun bs!28195 () Bool)

(assert (= bs!28195 d!107128))

(assert (=> bs!28195 m!463285))

(assert (=> start!73178 d!107128))

(declare-fun d!107130 () Bool)

(assert (=> d!107130 (= (remainingBits!0 ((_ sign_extend 32) (size!9118 (buf!8260 thiss!877))) ((_ sign_extend 32) (currentByte!15313 thiss!877)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15308 thiss!877)))) (bvsub (bvmul ((_ sign_extend 32) (size!9118 (buf!8260 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15313 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15308 thiss!877))))))))

(assert (=> b!325257 d!107130))

(declare-fun d!107132 () Bool)

(assert (=> d!107132 (= (array_inv!8670 (buf!8260 thiss!877)) (bvsge (size!9118 (buf!8260 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!325258 d!107132))

(push 1)

(assert (not d!107128))

(assert (not d!107102))

(assert (not d!107124))

(check-sat)

(pop 1)

(push 1)

(check-sat)

