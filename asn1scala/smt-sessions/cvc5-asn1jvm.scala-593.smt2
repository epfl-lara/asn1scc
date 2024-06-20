; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17014 () Bool)

(assert start!17014)

(declare-fun b!83275 () Bool)

(declare-fun res!68521 () Bool)

(declare-fun e!55308 () Bool)

(assert (=> b!83275 (=> (not res!68521) (not e!55308))))

(declare-datatypes ((array!3812 0))(
  ( (array!3813 (arr!2373 (Array (_ BitVec 32) (_ BitVec 8))) (size!1736 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3034 0))(
  ( (BitStream!3035 (buf!2126 array!3812) (currentByte!4214 (_ BitVec 32)) (currentBit!4209 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!3034)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83275 (= res!68521 (validate_offset_bits!1 ((_ sign_extend 32) (size!1736 (buf!2126 b1!98))) ((_ sign_extend 32) (currentByte!4214 b1!98)) ((_ sign_extend 32) (currentBit!4209 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!83276 () Bool)

(declare-fun lt!132788 () (_ BitVec 64))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun lt!132789 () (_ BitVec 64))

(assert (=> b!83276 (= e!55308 (and (= lt!132788 (bvand b1b2Diff!1 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!132788 (bvand (bvadd lt!132789 b1b2Diff!1) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!83276 (= lt!132788 (bvand lt!132789 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83276 (= lt!132789 (bitIndex!0 (size!1736 (buf!2126 b1!98)) (currentByte!4214 b1!98) (currentBit!4209 b1!98)))))

(declare-fun b!83278 () Bool)

(declare-fun e!55309 () Bool)

(declare-fun b2!98 () BitStream!3034)

(declare-fun array_inv!1582 (array!3812) Bool)

(assert (=> b!83278 (= e!55309 (array_inv!1582 (buf!2126 b2!98)))))

(declare-fun res!68520 () Bool)

(assert (=> start!17014 (=> (not res!68520) (not e!55308))))

(assert (=> start!17014 (= res!68520 (and (= (size!1736 (buf!2126 b1!98)) (size!1736 (buf!2126 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!17014 e!55308))

(declare-fun e!55310 () Bool)

(declare-fun inv!12 (BitStream!3034) Bool)

(assert (=> start!17014 (and (inv!12 b1!98) e!55310)))

(assert (=> start!17014 (and (inv!12 b2!98) e!55309)))

(assert (=> start!17014 true))

(declare-fun b!83277 () Bool)

(assert (=> b!83277 (= e!55310 (array_inv!1582 (buf!2126 b1!98)))))

(assert (= (and start!17014 res!68520) b!83275))

(assert (= (and b!83275 res!68521) b!83276))

(assert (= start!17014 b!83277))

(assert (= start!17014 b!83278))

(declare-fun m!129843 () Bool)

(assert (=> b!83276 m!129843))

(declare-fun m!129845 () Bool)

(assert (=> start!17014 m!129845))

(declare-fun m!129847 () Bool)

(assert (=> start!17014 m!129847))

(declare-fun m!129849 () Bool)

(assert (=> b!83277 m!129849))

(declare-fun m!129851 () Bool)

(assert (=> b!83278 m!129851))

(declare-fun m!129853 () Bool)

(assert (=> b!83275 m!129853))

(push 1)

(assert (not b!83276))

(assert (not b!83275))

(assert (not b!83278))

(assert (not start!17014))

(assert (not b!83277))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!26606 () Bool)

(assert (=> d!26606 (= (array_inv!1582 (buf!2126 b2!98)) (bvsge (size!1736 (buf!2126 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!83278 d!26606))

(declare-fun d!26608 () Bool)

(assert (=> d!26608 (= (array_inv!1582 (buf!2126 b1!98)) (bvsge (size!1736 (buf!2126 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!83277 d!26608))

(declare-fun d!26610 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!26610 (= (inv!12 b1!98) (invariant!0 (currentBit!4209 b1!98) (currentByte!4214 b1!98) (size!1736 (buf!2126 b1!98))))))

(declare-fun bs!6540 () Bool)

(assert (= bs!6540 d!26610))

(declare-fun m!129883 () Bool)

(assert (=> bs!6540 m!129883))

(assert (=> start!17014 d!26610))

(declare-fun d!26612 () Bool)

(assert (=> d!26612 (= (inv!12 b2!98) (invariant!0 (currentBit!4209 b2!98) (currentByte!4214 b2!98) (size!1736 (buf!2126 b2!98))))))

(declare-fun bs!6541 () Bool)

(assert (= bs!6541 d!26612))

(declare-fun m!129885 () Bool)

(assert (=> bs!6541 m!129885))

(assert (=> start!17014 d!26612))

(declare-fun d!26614 () Bool)

(declare-fun e!55347 () Bool)

(assert (=> d!26614 e!55347))

(declare-fun res!68545 () Bool)

(assert (=> d!26614 (=> (not res!68545) (not e!55347))))

(declare-fun lt!132836 () (_ BitVec 64))

(declare-fun lt!132835 () (_ BitVec 64))

(declare-fun lt!132837 () (_ BitVec 64))

(assert (=> d!26614 (= res!68545 (= lt!132836 (bvsub lt!132837 lt!132835)))))

(assert (=> d!26614 (or (= (bvand lt!132837 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132835 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132837 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132837 lt!132835) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!26614 (= lt!132835 (remainingBits!0 ((_ sign_extend 32) (size!1736 (buf!2126 b1!98))) ((_ sign_extend 32) (currentByte!4214 b1!98)) ((_ sign_extend 32) (currentBit!4209 b1!98))))))

(declare-fun lt!132833 () (_ BitVec 64))

(declare-fun lt!132834 () (_ BitVec 64))

(assert (=> d!26614 (= lt!132837 (bvmul lt!132833 lt!132834))))

(assert (=> d!26614 (or (= lt!132833 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132834 (bvsdiv (bvmul lt!132833 lt!132834) lt!132833)))))

(assert (=> d!26614 (= lt!132834 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26614 (= lt!132833 ((_ sign_extend 32) (size!1736 (buf!2126 b1!98))))))

(assert (=> d!26614 (= lt!132836 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4214 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4209 b1!98))))))

(assert (=> d!26614 (invariant!0 (currentBit!4209 b1!98) (currentByte!4214 b1!98) (size!1736 (buf!2126 b1!98)))))

(assert (=> d!26614 (= (bitIndex!0 (size!1736 (buf!2126 b1!98)) (currentByte!4214 b1!98) (currentBit!4209 b1!98)) lt!132836)))

(declare-fun b!83313 () Bool)

(declare-fun res!68544 () Bool)

(assert (=> b!83313 (=> (not res!68544) (not e!55347))))

(assert (=> b!83313 (= res!68544 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!132836))))

(declare-fun b!83314 () Bool)

(declare-fun lt!132832 () (_ BitVec 64))

(assert (=> b!83314 (= e!55347 (bvsle lt!132836 (bvmul lt!132832 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83314 (or (= lt!132832 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!132832 #b0000000000000000000000000000000000000000000000000000000000001000) lt!132832)))))

(assert (=> b!83314 (= lt!132832 ((_ sign_extend 32) (size!1736 (buf!2126 b1!98))))))

(assert (= (and d!26614 res!68545) b!83313))

(assert (= (and b!83313 res!68544) b!83314))

(declare-fun m!129889 () Bool)

(assert (=> d!26614 m!129889))

(assert (=> d!26614 m!129883))

(assert (=> b!83276 d!26614))

(declare-fun d!26620 () Bool)

(assert (=> d!26620 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1736 (buf!2126 b1!98))) ((_ sign_extend 32) (currentByte!4214 b1!98)) ((_ sign_extend 32) (currentBit!4209 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1736 (buf!2126 b1!98))) ((_ sign_extend 32) (currentByte!4214 b1!98)) ((_ sign_extend 32) (currentBit!4209 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6544 () Bool)

(assert (= bs!6544 d!26620))

(assert (=> bs!6544 m!129889))

(assert (=> b!83275 d!26620))

(push 1)

(assert (not d!26612))

(assert (not d!26614))

(assert (not d!26610))

(assert (not d!26620))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

