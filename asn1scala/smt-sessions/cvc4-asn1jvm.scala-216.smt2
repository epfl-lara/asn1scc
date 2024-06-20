; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4382 () Bool)

(assert start!4382)

(declare-fun b!18002 () Bool)

(declare-fun e!11547 () Bool)

(declare-fun e!11548 () Bool)

(assert (=> b!18002 (= e!11547 e!11548)))

(declare-fun res!15831 () Bool)

(assert (=> b!18002 (=> res!15831 e!11548)))

(declare-datatypes ((array!1197 0))(
  ( (array!1198 (arr!942 (Array (_ BitVec 32) (_ BitVec 8))) (size!507 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!884 0))(
  ( (BitStream!885 (buf!825 array!1197) (currentByte!2052 (_ BitVec 32)) (currentBit!2047 (_ BitVec 32))) )
))
(declare-fun thiss!1917 () BitStream!884)

(declare-datatypes ((tuple2!2094 0))(
  ( (tuple2!2095 (_1!1117 array!1197) (_2!1117 BitStream!884)) )
))
(declare-fun lt!25987 () tuple2!2094)

(assert (=> b!18002 (= res!15831 (not (= (currentByte!2052 thiss!1917) (size!507 (buf!825 (_2!1117 lt!25987))))))))

(declare-fun b!18003 () Bool)

(declare-fun e!11546 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!18003 (= e!11546 (invariant!0 (currentBit!2047 thiss!1917) (currentByte!2052 (_2!1117 lt!25987)) (size!507 (buf!825 (_2!1117 lt!25987)))))))

(declare-fun b!18004 () Bool)

(declare-fun e!11550 () Bool)

(declare-fun inv!12 (BitStream!884) Bool)

(assert (=> b!18004 (= e!11550 (inv!12 (BitStream!885 (buf!825 (_2!1117 lt!25987)) (currentByte!2052 (_2!1117 lt!25987)) (currentBit!2047 thiss!1917))))))

(declare-fun b!18005 () Bool)

(assert (=> b!18005 (= e!11548 e!11546)))

(declare-fun res!15833 () Bool)

(assert (=> b!18005 (=> (not res!15833) (not e!11546))))

(assert (=> b!18005 (= res!15833 (and (= (currentBit!2047 (_2!1117 lt!25987)) #b00000000000000000000000000000000) (= (currentBit!2047 thiss!1917) #b00000000000000000000000000000000)))))

(declare-fun res!15828 () Bool)

(declare-fun e!11545 () Bool)

(assert (=> start!4382 (=> (not res!15828) (not e!11545))))

(declare-fun nBits!604 () (_ BitVec 64))

(assert (=> start!4382 (= res!15828 (bvsge nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!4382 e!11545))

(assert (=> start!4382 true))

(declare-fun e!11549 () Bool)

(assert (=> start!4382 (and (inv!12 thiss!1917) e!11549)))

(declare-fun b!18006 () Bool)

(declare-fun res!15832 () Bool)

(assert (=> b!18006 (=> (not res!15832) (not e!11545))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18006 (= res!15832 (validate_offset_bits!1 ((_ sign_extend 32) (size!507 (buf!825 thiss!1917))) ((_ sign_extend 32) (currentByte!2052 thiss!1917)) ((_ sign_extend 32) (currentBit!2047 thiss!1917)) nBits!604))))

(declare-fun b!18007 () Bool)

(declare-fun array_inv!477 (array!1197) Bool)

(assert (=> b!18007 (= e!11549 (array_inv!477 (buf!825 thiss!1917)))))

(declare-fun b!18008 () Bool)

(assert (=> b!18008 (= e!11545 (not e!11550))))

(declare-fun res!15829 () Bool)

(assert (=> b!18008 (=> res!15829 e!11550)))

(assert (=> b!18008 (= res!15829 (not (= (currentByte!2052 thiss!1917) (size!507 (buf!825 (_2!1117 lt!25987))))))))

(assert (=> b!18008 e!11547))

(declare-fun res!15830 () Bool)

(assert (=> b!18008 (=> (not res!15830) (not e!11547))))

(assert (=> b!18008 (= res!15830 (invariant!0 (currentBit!2047 (_2!1117 lt!25987)) (currentByte!2052 (_2!1117 lt!25987)) (size!507 (buf!825 (_2!1117 lt!25987)))))))

(declare-fun readBits!0 (BitStream!884 (_ BitVec 64)) tuple2!2094)

(assert (=> b!18008 (= lt!25987 (readBits!0 thiss!1917 nBits!604))))

(assert (= (and start!4382 res!15828) b!18006))

(assert (= (and b!18006 res!15832) b!18008))

(assert (= (and b!18008 res!15830) b!18002))

(assert (= (and b!18002 (not res!15831)) b!18005))

(assert (= (and b!18005 res!15833) b!18003))

(assert (= (and b!18008 (not res!15829)) b!18004))

(assert (= start!4382 b!18007))

(declare-fun m!24347 () Bool)

(assert (=> b!18008 m!24347))

(declare-fun m!24349 () Bool)

(assert (=> b!18008 m!24349))

(declare-fun m!24351 () Bool)

(assert (=> b!18006 m!24351))

(declare-fun m!24353 () Bool)

(assert (=> b!18007 m!24353))

(declare-fun m!24355 () Bool)

(assert (=> b!18004 m!24355))

(declare-fun m!24357 () Bool)

(assert (=> start!4382 m!24357))

(declare-fun m!24359 () Bool)

(assert (=> b!18003 m!24359))

(push 1)

(assert (not b!18003))

(assert (not b!18004))

(assert (not b!18008))

(assert (not start!4382))

(assert (not b!18006))

(assert (not b!18007))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5912 () Bool)

(assert (=> d!5912 (= (inv!12 (BitStream!885 (buf!825 (_2!1117 lt!25987)) (currentByte!2052 (_2!1117 lt!25987)) (currentBit!2047 thiss!1917))) (invariant!0 (currentBit!2047 (BitStream!885 (buf!825 (_2!1117 lt!25987)) (currentByte!2052 (_2!1117 lt!25987)) (currentBit!2047 thiss!1917))) (currentByte!2052 (BitStream!885 (buf!825 (_2!1117 lt!25987)) (currentByte!2052 (_2!1117 lt!25987)) (currentBit!2047 thiss!1917))) (size!507 (buf!825 (BitStream!885 (buf!825 (_2!1117 lt!25987)) (currentByte!2052 (_2!1117 lt!25987)) (currentBit!2047 thiss!1917))))))))

(declare-fun bs!1679 () Bool)

(assert (= bs!1679 d!5912))

(declare-fun m!24365 () Bool)

(assert (=> bs!1679 m!24365))

(assert (=> b!18004 d!5912))

(declare-fun d!5920 () Bool)

(assert (=> d!5920 (= (inv!12 thiss!1917) (invariant!0 (currentBit!2047 thiss!1917) (currentByte!2052 thiss!1917) (size!507 (buf!825 thiss!1917))))))

(declare-fun bs!1680 () Bool)

(assert (= bs!1680 d!5920))

(declare-fun m!24367 () Bool)

(assert (=> bs!1680 m!24367))

(assert (=> start!4382 d!5920))

(declare-fun d!5922 () Bool)

(assert (=> d!5922 (= (invariant!0 (currentBit!2047 thiss!1917) (currentByte!2052 (_2!1117 lt!25987)) (size!507 (buf!825 (_2!1117 lt!25987)))) (and (bvsge (currentBit!2047 thiss!1917) #b00000000000000000000000000000000) (bvslt (currentBit!2047 thiss!1917) #b00000000000000000000000000001000) (bvsge (currentByte!2052 (_2!1117 lt!25987)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2052 (_2!1117 lt!25987)) (size!507 (buf!825 (_2!1117 lt!25987)))) (and (= (currentBit!2047 thiss!1917) #b00000000000000000000000000000000) (= (currentByte!2052 (_2!1117 lt!25987)) (size!507 (buf!825 (_2!1117 lt!25987))))))))))

(assert (=> b!18003 d!5922))

(declare-fun d!5924 () Bool)

(assert (=> d!5924 (= (invariant!0 (currentBit!2047 (_2!1117 lt!25987)) (currentByte!2052 (_2!1117 lt!25987)) (size!507 (buf!825 (_2!1117 lt!25987)))) (and (bvsge (currentBit!2047 (_2!1117 lt!25987)) #b00000000000000000000000000000000) (bvslt (currentBit!2047 (_2!1117 lt!25987)) #b00000000000000000000000000001000) (bvsge (currentByte!2052 (_2!1117 lt!25987)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2052 (_2!1117 lt!25987)) (size!507 (buf!825 (_2!1117 lt!25987)))) (and (= (currentBit!2047 (_2!1117 lt!25987)) #b00000000000000000000000000000000) (= (currentByte!2052 (_2!1117 lt!25987)) (size!507 (buf!825 (_2!1117 lt!25987))))))))))

(assert (=> b!18008 d!5924))

(declare-fun b!18044 () Bool)

(declare-fun res!15873 () Bool)

(declare-fun e!11558 () Bool)

(assert (=> b!18044 (=> (not res!15873) (not e!11558))))

(declare-fun lt!26051 () tuple2!2094)

(assert (=> b!18044 (= res!15873 (invariant!0 (currentBit!2047 (_2!1117 lt!26051)) (currentByte!2052 (_2!1117 lt!26051)) (size!507 (buf!825 (_2!1117 lt!26051)))))))

(declare-fun b!18045 () Bool)

(declare-datatypes ((List!198 0))(
  ( (Nil!195) (Cons!194 (h!313 Bool) (t!948 List!198)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!884 array!1197 (_ BitVec 64) (_ BitVec 64)) List!198)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!884 BitStream!884 (_ BitVec 64)) List!198)

(assert (=> b!18045 (= e!11558 (= (byteArrayBitContentToList!0 (_2!1117 lt!26051) (_1!1117 lt!26051) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604) (bitStreamReadBitsIntoList!0 (_2!1117 lt!26051) thiss!1917 nBits!604)))))

(declare-fun b!18046 () Bool)

(declare-fun res!15872 () Bool)

(assert (=> b!18046 (=> (not res!15872) (not e!11558))))

(assert (=> b!18046 (= res!15872 (bvsle (currentByte!2052 thiss!1917) (currentByte!2052 (_2!1117 lt!26051))))))

(declare-fun b!18047 () Bool)

(declare-fun res!15870 () Bool)

(assert (=> b!18047 (=> (not res!15870) (not e!11558))))

(declare-fun lt!26054 () (_ BitVec 64))

(assert (=> b!18047 (= res!15870 (= (size!507 (_1!1117 lt!26051)) ((_ extract 31 0) lt!26054)))))

(assert (=> b!18047 (and (bvslt lt!26054 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!26054 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!26059 () (_ BitVec 64))

(declare-fun lt!26055 () (_ BitVec 64))

(assert (=> b!18047 (= lt!26054 (bvsdiv lt!26059 lt!26055))))

(assert (=> b!18047 (and (not (= lt!26055 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!26059 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!26055 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!18047 (= lt!26055 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!26053 () (_ BitVec 64))

(declare-fun lt!26056 () (_ BitVec 64))

(assert (=> b!18047 (= lt!26059 (bvsub lt!26053 lt!26056))))

(assert (=> b!18047 (or (= (bvand lt!26053 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!26056 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!26053 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!26053 lt!26056) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!18047 (= lt!26056 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!26058 () (_ BitVec 64))

(assert (=> b!18047 (= lt!26053 (bvadd nBits!604 lt!26058))))

(assert (=> b!18047 (or (not (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!26058 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!604 lt!26058) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!18047 (= lt!26058 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun d!5926 () Bool)

(assert (=> d!5926 e!11558))

(declare-fun res!15871 () Bool)

(assert (=> d!5926 (=> (not res!15871) (not e!11558))))

(assert (=> d!5926 (= res!15871 (= (buf!825 (_2!1117 lt!26051)) (buf!825 thiss!1917)))))

(declare-datatypes ((Unit!1606 0))(
  ( (Unit!1607) )
))
(declare-datatypes ((tuple3!132 0))(
  ( (tuple3!133 (_1!1120 Unit!1606) (_2!1120 BitStream!884) (_3!72 array!1197)) )
))
(declare-fun lt!26057 () tuple3!132)

(assert (=> d!5926 (= lt!26051 (tuple2!2095 (_3!72 lt!26057) (_2!1120 lt!26057)))))

(declare-fun readBitsLoop!0 (BitStream!884 (_ BitVec 64) array!1197 (_ BitVec 64) (_ BitVec 64)) tuple3!132)

(assert (=> d!5926 (= lt!26057 (readBitsLoop!0 thiss!1917 nBits!604 (array!1198 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!604 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604))))

(assert (=> d!5926 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604) (bvsle nBits!604 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!5926 (= (readBits!0 thiss!1917 nBits!604) lt!26051)))

(declare-fun b!18048 () Bool)

(declare-fun res!15869 () Bool)

(assert (=> b!18048 (=> (not res!15869) (not e!11558))))

(declare-fun lt!26052 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!18048 (= res!15869 (= (bvadd lt!26052 nBits!604) (bitIndex!0 (size!507 (buf!825 (_2!1117 lt!26051))) (currentByte!2052 (_2!1117 lt!26051)) (currentBit!2047 (_2!1117 lt!26051)))))))

(assert (=> b!18048 (or (not (= (bvand lt!26052 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!26052 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!26052 nBits!604) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!18048 (= lt!26052 (bitIndex!0 (size!507 (buf!825 thiss!1917)) (currentByte!2052 thiss!1917) (currentBit!2047 thiss!1917)))))

(assert (= (and d!5926 res!15871) b!18048))

(assert (= (and b!18048 res!15869) b!18044))

(assert (= (and b!18044 res!15873) b!18047))

(assert (= (and b!18047 res!15870) b!18046))

(assert (= (and b!18046 res!15872) b!18045))

(declare-fun m!24385 () Bool)

(assert (=> b!18044 m!24385))

(declare-fun m!24387 () Bool)

(assert (=> b!18045 m!24387))

(declare-fun m!24389 () Bool)

(assert (=> b!18045 m!24389))

(declare-fun m!24391 () Bool)

(assert (=> d!5926 m!24391))

(declare-fun m!24393 () Bool)

(assert (=> b!18048 m!24393))

(declare-fun m!24395 () Bool)

(assert (=> b!18048 m!24395))

(assert (=> b!18008 d!5926))

(declare-fun d!5936 () Bool)

(assert (=> d!5936 (= (array_inv!477 (buf!825 thiss!1917)) (bvsge (size!507 (buf!825 thiss!1917)) #b00000000000000000000000000000000))))

(assert (=> b!18007 d!5936))

(declare-fun d!5944 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!5944 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!507 (buf!825 thiss!1917))) ((_ sign_extend 32) (currentByte!2052 thiss!1917)) ((_ sign_extend 32) (currentBit!2047 thiss!1917)) nBits!604) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!507 (buf!825 thiss!1917))) ((_ sign_extend 32) (currentByte!2052 thiss!1917)) ((_ sign_extend 32) (currentBit!2047 thiss!1917))) nBits!604))))

(declare-fun bs!1685 () Bool)

(assert (= bs!1685 d!5944))

(declare-fun m!24413 () Bool)

(assert (=> bs!1685 m!24413))

(assert (=> b!18006 d!5944))

(push 1)

