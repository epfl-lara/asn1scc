; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73152 () Bool)

(assert start!73152)

(declare-fun res!266898 () Bool)

(declare-fun e!234474 () Bool)

(assert (=> start!73152 (=> (not res!266898) (not e!234474))))

(declare-datatypes ((array!20991 0))(
  ( (array!20992 (arr!10209 (Array (_ BitVec 32) (_ BitVec 8))) (size!9117 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14396 0))(
  ( (BitStream!14397 (buf!8259 array!20991) (currentByte!15306 (_ BitVec 32)) (currentBit!15301 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14396)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73152 (= res!266898 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9117 (buf!8259 thiss!877))) ((_ sign_extend 32) (currentByte!15306 thiss!877)) ((_ sign_extend 32) (currentBit!15301 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!73152 e!234474))

(declare-fun e!234472 () Bool)

(declare-fun inv!12 (BitStream!14396) Bool)

(assert (=> start!73152 (and (inv!12 thiss!877) e!234472)))

(declare-fun b!325229 () Bool)

(declare-fun res!266899 () Bool)

(assert (=> b!325229 (=> (not res!266899) (not e!234474))))

(assert (=> b!325229 (= res!266899 (bvslt (currentBit!15301 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!325230 () Bool)

(declare-fun lt!447596 () (_ BitVec 64))

(declare-fun lt!447595 () (_ BitVec 64))

(assert (=> b!325230 (= e!234474 (and (= lt!447596 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= lt!447596 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!447595) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!325230 (= lt!447596 (bvand lt!447595 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!325230 (= lt!447595 (bitIndex!0 (size!9117 (buf!8259 thiss!877)) (currentByte!15306 thiss!877) (currentBit!15301 thiss!877)))))

(declare-fun b!325231 () Bool)

(declare-fun array_inv!8669 (array!20991) Bool)

(assert (=> b!325231 (= e!234472 (array_inv!8669 (buf!8259 thiss!877)))))

(assert (= (and start!73152 res!266898) b!325229))

(assert (= (and b!325229 res!266899) b!325230))

(assert (= start!73152 b!325231))

(declare-fun m!463229 () Bool)

(assert (=> start!73152 m!463229))

(declare-fun m!463231 () Bool)

(assert (=> start!73152 m!463231))

(declare-fun m!463233 () Bool)

(assert (=> b!325230 m!463233))

(declare-fun m!463235 () Bool)

(assert (=> b!325231 m!463235))

(push 1)

(assert (not b!325230))

(assert (not b!325231))

(assert (not start!73152))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107084 () Bool)

(declare-fun e!234482 () Bool)

(assert (=> d!107084 e!234482))

(declare-fun res!266914 () Bool)

(assert (=> d!107084 (=> (not res!266914) (not e!234482))))

(declare-fun lt!447643 () (_ BitVec 64))

(declare-fun lt!447641 () (_ BitVec 64))

(declare-fun lt!447639 () (_ BitVec 64))

(assert (=> d!107084 (= res!266914 (= lt!447641 (bvsub lt!447643 lt!447639)))))

(assert (=> d!107084 (or (= (bvand lt!447643 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447639 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447643 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447643 lt!447639) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107084 (= lt!447639 (remainingBits!0 ((_ sign_extend 32) (size!9117 (buf!8259 thiss!877))) ((_ sign_extend 32) (currentByte!15306 thiss!877)) ((_ sign_extend 32) (currentBit!15301 thiss!877))))))

(declare-fun lt!447640 () (_ BitVec 64))

(declare-fun lt!447644 () (_ BitVec 64))

(assert (=> d!107084 (= lt!447643 (bvmul lt!447640 lt!447644))))

(assert (=> d!107084 (or (= lt!447640 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447644 (bvsdiv (bvmul lt!447640 lt!447644) lt!447640)))))

(assert (=> d!107084 (= lt!447644 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!107084 (= lt!447640 ((_ sign_extend 32) (size!9117 (buf!8259 thiss!877))))))

(assert (=> d!107084 (= lt!447641 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15306 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15301 thiss!877))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!107084 (invariant!0 (currentBit!15301 thiss!877) (currentByte!15306 thiss!877) (size!9117 (buf!8259 thiss!877)))))

(assert (=> d!107084 (= (bitIndex!0 (size!9117 (buf!8259 thiss!877)) (currentByte!15306 thiss!877) (currentBit!15301 thiss!877)) lt!447641)))

(declare-fun b!325246 () Bool)

(declare-fun res!266915 () Bool)

(assert (=> b!325246 (=> (not res!266915) (not e!234482))))

(assert (=> b!325246 (= res!266915 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447641))))

(declare-fun b!325247 () Bool)

(declare-fun lt!447642 () (_ BitVec 64))

(assert (=> b!325247 (= e!234482 (bvsle lt!447641 (bvmul lt!447642 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325247 (or (= lt!447642 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447642 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447642)))))

(assert (=> b!325247 (= lt!447642 ((_ sign_extend 32) (size!9117 (buf!8259 thiss!877))))))

(assert (= (and d!107084 res!266914) b!325246))

(assert (= (and b!325246 res!266915) b!325247))

(assert (=> d!107084 m!463229))

(declare-fun m!463241 () Bool)

(assert (=> d!107084 m!463241))

(assert (=> b!325230 d!107084))

(declare-fun d!107090 () Bool)

(assert (=> d!107090 (= (array_inv!8669 (buf!8259 thiss!877)) (bvsge (size!9117 (buf!8259 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!325231 d!107090))

(declare-fun d!107092 () Bool)

(assert (=> d!107092 (= (remainingBits!0 ((_ sign_extend 32) (size!9117 (buf!8259 thiss!877))) ((_ sign_extend 32) (currentByte!15306 thiss!877)) ((_ sign_extend 32) (currentBit!15301 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9117 (buf!8259 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15306 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15301 thiss!877)))))))

(assert (=> start!73152 d!107092))

(declare-fun d!107096 () Bool)

(assert (=> d!107096 (= (inv!12 thiss!877) (invariant!0 (currentBit!15301 thiss!877) (currentByte!15306 thiss!877) (size!9117 (buf!8259 thiss!877))))))

(declare-fun bs!28189 () Bool)

(assert (= bs!28189 d!107096))

(assert (=> bs!28189 m!463241))

(assert (=> start!73152 d!107096))

(push 1)

(assert (not d!107084))

(assert (not d!107096))

(check-sat)

(pop 1)

(push 1)

(check-sat)

