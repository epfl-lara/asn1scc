; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16768 () Bool)

(assert start!16768)

(declare-fun res!68116 () Bool)

(declare-fun e!54738 () Bool)

(assert (=> start!16768 (=> (not res!68116) (not e!54738))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-datatypes ((array!3747 0))(
  ( (array!3748 (arr!2348 (Array (_ BitVec 32) (_ BitVec 8))) (size!1711 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2984 0))(
  ( (BitStream!2985 (buf!2101 array!3747) (currentByte!4137 (_ BitVec 32)) (currentBit!4132 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!2984)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun b1!98 () BitStream!2984)

(assert (=> start!16768 (= res!68116 (and (= (size!1711 (buf!2101 b1!98)) (size!1711 (buf!2101 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16768 e!54738))

(declare-fun e!54736 () Bool)

(declare-fun inv!12 (BitStream!2984) Bool)

(assert (=> start!16768 (and (inv!12 b1!98) e!54736)))

(declare-fun e!54739 () Bool)

(assert (=> start!16768 (and (inv!12 b2!98) e!54739)))

(assert (=> start!16768 true))

(declare-fun b!82701 () Bool)

(declare-fun e!54735 () Bool)

(assert (=> b!82701 (= e!54738 e!54735)))

(declare-fun res!68113 () Bool)

(assert (=> b!82701 (=> (not res!68113) (not e!54735))))

(declare-fun lt!131684 () (_ BitVec 64))

(declare-fun lt!131682 () (_ BitVec 64))

(assert (=> b!82701 (= res!68113 (= lt!131684 lt!131682))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!82701 (= lt!131682 (bitIndex!0 (size!1711 (buf!2101 b2!98)) (currentByte!4137 b2!98) (currentBit!4132 b2!98)))))

(declare-fun lt!131681 () (_ BitVec 64))

(assert (=> b!82701 (= lt!131684 (bvadd lt!131681 b1b2Diff!1))))

(assert (=> b!82701 (= lt!131681 (bitIndex!0 (size!1711 (buf!2101 b1!98)) (currentByte!4137 b1!98) (currentBit!4132 b1!98)))))

(declare-fun b!82702 () Bool)

(declare-fun e!54741 () Bool)

(assert (=> b!82702 (= e!54735 (not e!54741))))

(declare-fun res!68115 () Bool)

(assert (=> b!82702 (=> res!68115 e!54741)))

(declare-fun lt!131686 () (_ BitVec 64))

(assert (=> b!82702 (= res!68115 (bvsgt lt!131681 (bvsub lt!131686 b1ValidateOffsetBits!11)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!82702 (= (remainingBits!0 ((_ sign_extend 32) (size!1711 (buf!2101 b1!98))) ((_ sign_extend 32) (currentByte!4137 b1!98)) ((_ sign_extend 32) (currentBit!4132 b1!98))) (bvsub lt!131686 lt!131681))))

(assert (=> b!82702 (= lt!131686 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1711 (buf!2101 b1!98)))))))

(declare-datatypes ((Unit!5531 0))(
  ( (Unit!5532) )
))
(declare-fun lt!131688 () Unit!5531)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2984) Unit!5531)

(assert (=> b!82702 (= lt!131688 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!82703 () Bool)

(declare-fun array_inv!1557 (array!3747) Bool)

(assert (=> b!82703 (= e!54736 (array_inv!1557 (buf!2101 b1!98)))))

(declare-fun b!82704 () Bool)

(declare-fun res!68112 () Bool)

(assert (=> b!82704 (=> (not res!68112) (not e!54738))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!82704 (= res!68112 (validate_offset_bits!1 ((_ sign_extend 32) (size!1711 (buf!2101 b1!98))) ((_ sign_extend 32) (currentByte!4137 b1!98)) ((_ sign_extend 32) (currentBit!4132 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!82705 () Bool)

(declare-fun e!54740 () Bool)

(assert (=> b!82705 (= e!54741 e!54740)))

(declare-fun res!68114 () Bool)

(assert (=> b!82705 (=> res!68114 e!54740)))

(declare-fun lt!131687 () (_ BitVec 64))

(declare-fun lt!131683 () (_ BitVec 64))

(assert (=> b!82705 (= res!68114 (or (not (= lt!131683 (bvsub lt!131687 lt!131684))) (bvsgt ((_ sign_extend 32) (size!1711 (buf!2101 b2!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4137 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4132 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvslt ((_ sign_extend 32) (size!1711 (buf!2101 b2!98))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4137 b2!98)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4132 b2!98)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!82705 (= lt!131683 (bvsub lt!131687 lt!131682))))

(assert (=> b!82705 (= lt!131683 (remainingBits!0 ((_ sign_extend 32) (size!1711 (buf!2101 b2!98))) ((_ sign_extend 32) (currentByte!4137 b2!98)) ((_ sign_extend 32) (currentBit!4132 b2!98))))))

(assert (=> b!82705 (= lt!131687 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1711 (buf!2101 b2!98)))))))

(declare-fun lt!131685 () Unit!5531)

(assert (=> b!82705 (= lt!131685 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun b!82706 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!82706 (= e!54740 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4132 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4137 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1711 (buf!2101 b2!98))))))))

(declare-fun b!82707 () Bool)

(assert (=> b!82707 (= e!54739 (array_inv!1557 (buf!2101 b2!98)))))

(assert (= (and start!16768 res!68116) b!82704))

(assert (= (and b!82704 res!68112) b!82701))

(assert (= (and b!82701 res!68113) b!82702))

(assert (= (and b!82702 (not res!68115)) b!82705))

(assert (= (and b!82705 (not res!68114)) b!82706))

(assert (= start!16768 b!82703))

(assert (= start!16768 b!82707))

(declare-fun m!129189 () Bool)

(assert (=> start!16768 m!129189))

(declare-fun m!129191 () Bool)

(assert (=> start!16768 m!129191))

(declare-fun m!129193 () Bool)

(assert (=> b!82702 m!129193))

(declare-fun m!129195 () Bool)

(assert (=> b!82702 m!129195))

(declare-fun m!129197 () Bool)

(assert (=> b!82705 m!129197))

(declare-fun m!129199 () Bool)

(assert (=> b!82705 m!129199))

(declare-fun m!129201 () Bool)

(assert (=> b!82701 m!129201))

(declare-fun m!129203 () Bool)

(assert (=> b!82701 m!129203))

(declare-fun m!129205 () Bool)

(assert (=> b!82704 m!129205))

(declare-fun m!129207 () Bool)

(assert (=> b!82706 m!129207))

(declare-fun m!129209 () Bool)

(assert (=> b!82707 m!129209))

(declare-fun m!129211 () Bool)

(assert (=> b!82703 m!129211))

(push 1)

(assert (not b!82707))

(assert (not b!82702))

(assert (not b!82701))

(assert (not b!82704))

(assert (not b!82706))

(assert (not start!16768))

(assert (not b!82703))

(assert (not b!82705))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!26258 () Bool)

(assert (=> d!26258 (= (array_inv!1557 (buf!2101 b2!98)) (bvsge (size!1711 (buf!2101 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!82707 d!26258))

(declare-fun d!26260 () Bool)

(assert (=> d!26260 (= (remainingBits!0 ((_ sign_extend 32) (size!1711 (buf!2101 b1!98))) ((_ sign_extend 32) (currentByte!4137 b1!98)) ((_ sign_extend 32) (currentBit!4132 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1711 (buf!2101 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4137 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4132 b1!98)))))))

(assert (=> b!82702 d!26260))

(declare-fun d!26266 () Bool)

(declare-fun lt!131761 () (_ BitVec 64))

(declare-fun lt!131762 () (_ BitVec 64))

(assert (=> d!26266 (= (remainingBits!0 ((_ sign_extend 32) (size!1711 (buf!2101 b1!98))) ((_ sign_extend 32) (currentByte!4137 b1!98)) ((_ sign_extend 32) (currentBit!4132 b1!98))) (bvsub lt!131761 lt!131762))))

(assert (=> d!26266 (or (= (bvand lt!131761 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131762 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131761 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131761 lt!131762) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26266 (= lt!131762 (bitIndex!0 (size!1711 (buf!2101 b1!98)) (currentByte!4137 b1!98) (currentBit!4132 b1!98)))))

(declare-fun lt!131760 () (_ BitVec 64))

(declare-fun lt!131759 () (_ BitVec 64))

(assert (=> d!26266 (= lt!131761 (bvmul lt!131760 lt!131759))))

(assert (=> d!26266 (or (= lt!131760 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131759 (bvsdiv (bvmul lt!131760 lt!131759) lt!131760)))))

(assert (=> d!26266 (= lt!131759 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26266 (= lt!131760 ((_ sign_extend 32) (size!1711 (buf!2101 b1!98))))))

(declare-fun lt!131758 () Unit!5531)

(declare-fun choose!23 (BitStream!2984) Unit!5531)

(assert (=> d!26266 (= lt!131758 (choose!23 b1!98))))

(assert (=> d!26266 (= (remainingBitsBitIndexLemma!0 b1!98) lt!131758)))

(declare-fun bs!6443 () Bool)

(assert (= bs!6443 d!26266))

(assert (=> bs!6443 m!129193))

(assert (=> bs!6443 m!129203))

(declare-fun m!129223 () Bool)

(assert (=> bs!6443 m!129223))

(assert (=> b!82702 d!26266))

(declare-fun d!26280 () Bool)

(assert (=> d!26280 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4132 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4137 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1711 (buf!2101 b2!98))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4132 b2!98))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4132 b2!98))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4137 b2!98))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4137 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1711 (buf!2101 b2!98))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4132 b2!98))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4137 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1711 (buf!2101 b2!98)))))))))))

(assert (=> b!82706 d!26280))

(declare-fun d!26282 () Bool)

(declare-fun e!54752 () Bool)

(assert (=> d!26282 e!54752))

(declare-fun res!68137 () Bool)

(assert (=> d!26282 (=> (not res!68137) (not e!54752))))

(declare-fun lt!131800 () (_ BitVec 64))

(declare-fun lt!131801 () (_ BitVec 64))

(declare-fun lt!131803 () (_ BitVec 64))

(assert (=> d!26282 (= res!68137 (= lt!131801 (bvsub lt!131803 lt!131800)))))

(assert (=> d!26282 (or (= (bvand lt!131803 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131800 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131803 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131803 lt!131800) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26282 (= lt!131800 (remainingBits!0 ((_ sign_extend 32) (size!1711 (buf!2101 b2!98))) ((_ sign_extend 32) (currentByte!4137 b2!98)) ((_ sign_extend 32) (currentBit!4132 b2!98))))))

(declare-fun lt!131804 () (_ BitVec 64))

(declare-fun lt!131802 () (_ BitVec 64))

(assert (=> d!26282 (= lt!131803 (bvmul lt!131804 lt!131802))))

(assert (=> d!26282 (or (= lt!131804 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131802 (bvsdiv (bvmul lt!131804 lt!131802) lt!131804)))))

(assert (=> d!26282 (= lt!131802 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26282 (= lt!131804 ((_ sign_extend 32) (size!1711 (buf!2101 b2!98))))))

(assert (=> d!26282 (= lt!131801 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4137 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4132 b2!98))))))

(assert (=> d!26282 (invariant!0 (currentBit!4132 b2!98) (currentByte!4137 b2!98) (size!1711 (buf!2101 b2!98)))))

(assert (=> d!26282 (= (bitIndex!0 (size!1711 (buf!2101 b2!98)) (currentByte!4137 b2!98) (currentBit!4132 b2!98)) lt!131801)))

(declare-fun b!82731 () Bool)

(declare-fun res!68138 () Bool)

(assert (=> b!82731 (=> (not res!68138) (not e!54752))))

(assert (=> b!82731 (= res!68138 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!131801))))

(declare-fun b!82732 () Bool)

(declare-fun lt!131799 () (_ BitVec 64))

(assert (=> b!82732 (= e!54752 (bvsle lt!131801 (bvmul lt!131799 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82732 (or (= lt!131799 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!131799 #b0000000000000000000000000000000000000000000000000000000000001000) lt!131799)))))

(assert (=> b!82732 (= lt!131799 ((_ sign_extend 32) (size!1711 (buf!2101 b2!98))))))

(assert (= (and d!26282 res!68137) b!82731))

(assert (= (and b!82731 res!68138) b!82732))

(assert (=> d!26282 m!129197))

(declare-fun m!129229 () Bool)

(assert (=> d!26282 m!129229))

(assert (=> b!82701 d!26282))

(declare-fun d!26292 () Bool)

(declare-fun e!54753 () Bool)

(assert (=> d!26292 e!54753))

(declare-fun res!68139 () Bool)

(assert (=> d!26292 (=> (not res!68139) (not e!54753))))

(declare-fun lt!131807 () (_ BitVec 64))

(declare-fun lt!131809 () (_ BitVec 64))

(declare-fun lt!131806 () (_ BitVec 64))

(assert (=> d!26292 (= res!68139 (= lt!131807 (bvsub lt!131809 lt!131806)))))

(assert (=> d!26292 (or (= (bvand lt!131809 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131806 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131809 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131809 lt!131806) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26292 (= lt!131806 (remainingBits!0 ((_ sign_extend 32) (size!1711 (buf!2101 b1!98))) ((_ sign_extend 32) (currentByte!4137 b1!98)) ((_ sign_extend 32) (currentBit!4132 b1!98))))))

(declare-fun lt!131810 () (_ BitVec 64))

(declare-fun lt!131808 () (_ BitVec 64))

(assert (=> d!26292 (= lt!131809 (bvmul lt!131810 lt!131808))))

(assert (=> d!26292 (or (= lt!131810 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131808 (bvsdiv (bvmul lt!131810 lt!131808) lt!131810)))))

(assert (=> d!26292 (= lt!131808 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26292 (= lt!131810 ((_ sign_extend 32) (size!1711 (buf!2101 b1!98))))))

(assert (=> d!26292 (= lt!131807 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4137 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4132 b1!98))))))

(assert (=> d!26292 (invariant!0 (currentBit!4132 b1!98) (currentByte!4137 b1!98) (size!1711 (buf!2101 b1!98)))))

(assert (=> d!26292 (= (bitIndex!0 (size!1711 (buf!2101 b1!98)) (currentByte!4137 b1!98) (currentBit!4132 b1!98)) lt!131807)))

(declare-fun b!82733 () Bool)

(declare-fun res!68140 () Bool)

(assert (=> b!82733 (=> (not res!68140) (not e!54753))))

(assert (=> b!82733 (= res!68140 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!131807))))

(declare-fun b!82734 () Bool)

(declare-fun lt!131805 () (_ BitVec 64))

(assert (=> b!82734 (= e!54753 (bvsle lt!131807 (bvmul lt!131805 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82734 (or (= lt!131805 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!131805 #b0000000000000000000000000000000000000000000000000000000000001000) lt!131805)))))

(assert (=> b!82734 (= lt!131805 ((_ sign_extend 32) (size!1711 (buf!2101 b1!98))))))

(assert (= (and d!26292 res!68139) b!82733))

(assert (= (and b!82733 res!68140) b!82734))

(assert (=> d!26292 m!129193))

(declare-fun m!129231 () Bool)

(assert (=> d!26292 m!129231))

(assert (=> b!82701 d!26292))

(declare-fun d!26300 () Bool)

(assert (=> d!26300 (= (remainingBits!0 ((_ sign_extend 32) (size!1711 (buf!2101 b2!98))) ((_ sign_extend 32) (currentByte!4137 b2!98)) ((_ sign_extend 32) (currentBit!4132 b2!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1711 (buf!2101 b2!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4137 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4132 b2!98)))))))

(assert (=> b!82705 d!26300))

(declare-fun d!26302 () Bool)

(declare-fun lt!131819 () (_ BitVec 64))

(declare-fun lt!131820 () (_ BitVec 64))

(assert (=> d!26302 (= (remainingBits!0 ((_ sign_extend 32) (size!1711 (buf!2101 b2!98))) ((_ sign_extend 32) (currentByte!4137 b2!98)) ((_ sign_extend 32) (currentBit!4132 b2!98))) (bvsub lt!131819 lt!131820))))

(assert (=> d!26302 (or (= (bvand lt!131819 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131820 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131819 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131819 lt!131820) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26302 (= lt!131820 (bitIndex!0 (size!1711 (buf!2101 b2!98)) (currentByte!4137 b2!98) (currentBit!4132 b2!98)))))

(declare-fun lt!131818 () (_ BitVec 64))

(declare-fun lt!131817 () (_ BitVec 64))

(assert (=> d!26302 (= lt!131819 (bvmul lt!131818 lt!131817))))

(assert (=> d!26302 (or (= lt!131818 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131817 (bvsdiv (bvmul lt!131818 lt!131817) lt!131818)))))

(assert (=> d!26302 (= lt!131817 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26302 (= lt!131818 ((_ sign_extend 32) (size!1711 (buf!2101 b2!98))))))

(declare-fun lt!131816 () Unit!5531)

(assert (=> d!26302 (= lt!131816 (choose!23 b2!98))))

(assert (=> d!26302 (= (remainingBitsBitIndexLemma!0 b2!98) lt!131816)))

(declare-fun bs!6448 () Bool)

(assert (= bs!6448 d!26302))

(assert (=> bs!6448 m!129197))

(assert (=> bs!6448 m!129201))

(declare-fun m!129235 () Bool)

(assert (=> bs!6448 m!129235))

(assert (=> b!82705 d!26302))

(declare-fun d!26304 () Bool)

(assert (=> d!26304 (= (array_inv!1557 (buf!2101 b1!98)) (bvsge (size!1711 (buf!2101 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!82703 d!26304))

(declare-fun d!26306 () Bool)

(assert (=> d!26306 (= (inv!12 b1!98) (invariant!0 (currentBit!4132 b1!98) (currentByte!4137 b1!98) (size!1711 (buf!2101 b1!98))))))

(declare-fun bs!6449 () Bool)

(assert (= bs!6449 d!26306))

(assert (=> bs!6449 m!129231))

(assert (=> start!16768 d!26306))

(declare-fun d!26308 () Bool)

(assert (=> d!26308 (= (inv!12 b2!98) (invariant!0 (currentBit!4132 b2!98) (currentByte!4137 b2!98) (size!1711 (buf!2101 b2!98))))))

(declare-fun bs!6450 () Bool)

(assert (= bs!6450 d!26308))

(assert (=> bs!6450 m!129229))

(assert (=> start!16768 d!26308))

(declare-fun d!26310 () Bool)

(assert (=> d!26310 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1711 (buf!2101 b1!98))) ((_ sign_extend 32) (currentByte!4137 b1!98)) ((_ sign_extend 32) (currentBit!4132 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1711 (buf!2101 b1!98))) ((_ sign_extend 32) (currentByte!4137 b1!98)) ((_ sign_extend 32) (currentBit!4132 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6451 () Bool)

(assert (= bs!6451 d!26310))

(assert (=> bs!6451 m!129193))

(assert (=> b!82704 d!26310))

(push 1)

