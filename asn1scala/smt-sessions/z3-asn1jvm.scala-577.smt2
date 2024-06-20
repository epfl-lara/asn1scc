; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16518 () Bool)

(assert start!16518)

(declare-fun b!82155 () Bool)

(declare-fun e!54201 () Bool)

(declare-datatypes ((array!3688 0))(
  ( (array!3689 (arr!2326 (Array (_ BitVec 32) (_ BitVec 8))) (size!1689 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2940 0))(
  ( (BitStream!2941 (buf!2079 array!3688) (currentByte!4059 (_ BitVec 32)) (currentBit!4054 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!2940)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!82155 (= e!54201 (not (invariant!0 (currentBit!4054 b1!98) (currentByte!4059 b1!98) (size!1689 (buf!2079 b1!98)))))))

(declare-fun lt!130641 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!82155 (= (remainingBits!0 ((_ sign_extend 32) (size!1689 (buf!2079 b1!98))) ((_ sign_extend 32) (currentByte!4059 b1!98)) ((_ sign_extend 32) (currentBit!4054 b1!98))) (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1689 (buf!2079 b1!98)))) lt!130641))))

(declare-datatypes ((Unit!5487 0))(
  ( (Unit!5488) )
))
(declare-fun lt!130640 () Unit!5487)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2940) Unit!5487)

(assert (=> b!82155 (= lt!130640 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!82156 () Bool)

(declare-fun res!67715 () Bool)

(declare-fun e!54199 () Bool)

(assert (=> b!82156 (=> (not res!67715) (not e!54199))))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!82156 (= res!67715 (validate_offset_bits!1 ((_ sign_extend 32) (size!1689 (buf!2079 b1!98))) ((_ sign_extend 32) (currentByte!4059 b1!98)) ((_ sign_extend 32) (currentBit!4054 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!82157 () Bool)

(declare-fun e!54202 () Bool)

(declare-fun array_inv!1535 (array!3688) Bool)

(assert (=> b!82157 (= e!54202 (array_inv!1535 (buf!2079 b1!98)))))

(declare-fun res!67716 () Bool)

(assert (=> start!16518 (=> (not res!67716) (not e!54199))))

(declare-fun b2!98 () BitStream!2940)

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(assert (=> start!16518 (= res!67716 (and (= (size!1689 (buf!2079 b1!98)) (size!1689 (buf!2079 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16518 e!54199))

(declare-fun inv!12 (BitStream!2940) Bool)

(assert (=> start!16518 (and (inv!12 b1!98) e!54202)))

(declare-fun e!54203 () Bool)

(assert (=> start!16518 (and (inv!12 b2!98) e!54203)))

(assert (=> start!16518 true))

(declare-fun b!82158 () Bool)

(assert (=> b!82158 (= e!54199 e!54201)))

(declare-fun res!67717 () Bool)

(assert (=> b!82158 (=> (not res!67717) (not e!54201))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!82158 (= res!67717 (= (bvadd lt!130641 b1b2Diff!1) (bitIndex!0 (size!1689 (buf!2079 b2!98)) (currentByte!4059 b2!98) (currentBit!4054 b2!98))))))

(assert (=> b!82158 (= lt!130641 (bitIndex!0 (size!1689 (buf!2079 b1!98)) (currentByte!4059 b1!98) (currentBit!4054 b1!98)))))

(declare-fun b!82159 () Bool)

(assert (=> b!82159 (= e!54203 (array_inv!1535 (buf!2079 b2!98)))))

(assert (= (and start!16518 res!67716) b!82156))

(assert (= (and b!82156 res!67715) b!82158))

(assert (= (and b!82158 res!67717) b!82155))

(assert (= start!16518 b!82157))

(assert (= start!16518 b!82159))

(declare-fun m!128585 () Bool)

(assert (=> b!82159 m!128585))

(declare-fun m!128587 () Bool)

(assert (=> b!82155 m!128587))

(declare-fun m!128589 () Bool)

(assert (=> b!82155 m!128589))

(declare-fun m!128591 () Bool)

(assert (=> b!82155 m!128591))

(declare-fun m!128593 () Bool)

(assert (=> b!82158 m!128593))

(declare-fun m!128595 () Bool)

(assert (=> b!82158 m!128595))

(declare-fun m!128597 () Bool)

(assert (=> start!16518 m!128597))

(declare-fun m!128599 () Bool)

(assert (=> start!16518 m!128599))

(declare-fun m!128601 () Bool)

(assert (=> b!82156 m!128601))

(declare-fun m!128603 () Bool)

(assert (=> b!82157 m!128603))

(check-sat (not b!82159) (not b!82155) (not b!82156) (not b!82157) (not start!16518) (not b!82158))
(check-sat)
(get-model)

(declare-fun d!25874 () Bool)

(assert (=> d!25874 (= (array_inv!1535 (buf!2079 b1!98)) (bvsge (size!1689 (buf!2079 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!82157 d!25874))

(declare-fun d!25876 () Bool)

(declare-fun e!54225 () Bool)

(assert (=> d!25876 e!54225))

(declare-fun res!67732 () Bool)

(assert (=> d!25876 (=> (not res!67732) (not e!54225))))

(declare-fun lt!130662 () (_ BitVec 64))

(declare-fun lt!130663 () (_ BitVec 64))

(declare-fun lt!130664 () (_ BitVec 64))

(assert (=> d!25876 (= res!67732 (= lt!130664 (bvsub lt!130663 lt!130662)))))

(assert (=> d!25876 (or (= (bvand lt!130663 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130662 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130663 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130663 lt!130662) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25876 (= lt!130662 (remainingBits!0 ((_ sign_extend 32) (size!1689 (buf!2079 b2!98))) ((_ sign_extend 32) (currentByte!4059 b2!98)) ((_ sign_extend 32) (currentBit!4054 b2!98))))))

(declare-fun lt!130660 () (_ BitVec 64))

(declare-fun lt!130665 () (_ BitVec 64))

(assert (=> d!25876 (= lt!130663 (bvmul lt!130660 lt!130665))))

(assert (=> d!25876 (or (= lt!130660 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130665 (bvsdiv (bvmul lt!130660 lt!130665) lt!130660)))))

(assert (=> d!25876 (= lt!130665 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25876 (= lt!130660 ((_ sign_extend 32) (size!1689 (buf!2079 b2!98))))))

(assert (=> d!25876 (= lt!130664 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4059 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4054 b2!98))))))

(assert (=> d!25876 (invariant!0 (currentBit!4054 b2!98) (currentByte!4059 b2!98) (size!1689 (buf!2079 b2!98)))))

(assert (=> d!25876 (= (bitIndex!0 (size!1689 (buf!2079 b2!98)) (currentByte!4059 b2!98) (currentBit!4054 b2!98)) lt!130664)))

(declare-fun b!82179 () Bool)

(declare-fun res!67731 () Bool)

(assert (=> b!82179 (=> (not res!67731) (not e!54225))))

(assert (=> b!82179 (= res!67731 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!130664))))

(declare-fun b!82180 () Bool)

(declare-fun lt!130661 () (_ BitVec 64))

(assert (=> b!82180 (= e!54225 (bvsle lt!130664 (bvmul lt!130661 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82180 (or (= lt!130661 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!130661 #b0000000000000000000000000000000000000000000000000000000000001000) lt!130661)))))

(assert (=> b!82180 (= lt!130661 ((_ sign_extend 32) (size!1689 (buf!2079 b2!98))))))

(assert (= (and d!25876 res!67732) b!82179))

(assert (= (and b!82179 res!67731) b!82180))

(declare-fun m!128625 () Bool)

(assert (=> d!25876 m!128625))

(declare-fun m!128627 () Bool)

(assert (=> d!25876 m!128627))

(assert (=> b!82158 d!25876))

(declare-fun d!25878 () Bool)

(declare-fun e!54226 () Bool)

(assert (=> d!25878 e!54226))

(declare-fun res!67734 () Bool)

(assert (=> d!25878 (=> (not res!67734) (not e!54226))))

(declare-fun lt!130670 () (_ BitVec 64))

(declare-fun lt!130669 () (_ BitVec 64))

(declare-fun lt!130668 () (_ BitVec 64))

(assert (=> d!25878 (= res!67734 (= lt!130670 (bvsub lt!130669 lt!130668)))))

(assert (=> d!25878 (or (= (bvand lt!130669 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130668 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130669 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130669 lt!130668) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25878 (= lt!130668 (remainingBits!0 ((_ sign_extend 32) (size!1689 (buf!2079 b1!98))) ((_ sign_extend 32) (currentByte!4059 b1!98)) ((_ sign_extend 32) (currentBit!4054 b1!98))))))

(declare-fun lt!130666 () (_ BitVec 64))

(declare-fun lt!130671 () (_ BitVec 64))

(assert (=> d!25878 (= lt!130669 (bvmul lt!130666 lt!130671))))

(assert (=> d!25878 (or (= lt!130666 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130671 (bvsdiv (bvmul lt!130666 lt!130671) lt!130666)))))

(assert (=> d!25878 (= lt!130671 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25878 (= lt!130666 ((_ sign_extend 32) (size!1689 (buf!2079 b1!98))))))

(assert (=> d!25878 (= lt!130670 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4059 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4054 b1!98))))))

(assert (=> d!25878 (invariant!0 (currentBit!4054 b1!98) (currentByte!4059 b1!98) (size!1689 (buf!2079 b1!98)))))

(assert (=> d!25878 (= (bitIndex!0 (size!1689 (buf!2079 b1!98)) (currentByte!4059 b1!98) (currentBit!4054 b1!98)) lt!130670)))

(declare-fun b!82181 () Bool)

(declare-fun res!67733 () Bool)

(assert (=> b!82181 (=> (not res!67733) (not e!54226))))

(assert (=> b!82181 (= res!67733 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!130670))))

(declare-fun b!82182 () Bool)

(declare-fun lt!130667 () (_ BitVec 64))

(assert (=> b!82182 (= e!54226 (bvsle lt!130670 (bvmul lt!130667 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82182 (or (= lt!130667 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!130667 #b0000000000000000000000000000000000000000000000000000000000001000) lt!130667)))))

(assert (=> b!82182 (= lt!130667 ((_ sign_extend 32) (size!1689 (buf!2079 b1!98))))))

(assert (= (and d!25878 res!67734) b!82181))

(assert (= (and b!82181 res!67733) b!82182))

(assert (=> d!25878 m!128589))

(assert (=> d!25878 m!128587))

(assert (=> b!82158 d!25878))

(declare-fun d!25882 () Bool)

(assert (=> d!25882 (= (inv!12 b1!98) (invariant!0 (currentBit!4054 b1!98) (currentByte!4059 b1!98) (size!1689 (buf!2079 b1!98))))))

(declare-fun bs!6340 () Bool)

(assert (= bs!6340 d!25882))

(assert (=> bs!6340 m!128587))

(assert (=> start!16518 d!25882))

(declare-fun d!25892 () Bool)

(assert (=> d!25892 (= (inv!12 b2!98) (invariant!0 (currentBit!4054 b2!98) (currentByte!4059 b2!98) (size!1689 (buf!2079 b2!98))))))

(declare-fun bs!6341 () Bool)

(assert (= bs!6341 d!25892))

(assert (=> bs!6341 m!128627))

(assert (=> start!16518 d!25892))

(declare-fun d!25894 () Bool)

(assert (=> d!25894 (= (array_inv!1535 (buf!2079 b2!98)) (bvsge (size!1689 (buf!2079 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!82159 d!25894))

(declare-fun d!25896 () Bool)

(assert (=> d!25896 (= (invariant!0 (currentBit!4054 b1!98) (currentByte!4059 b1!98) (size!1689 (buf!2079 b1!98))) (and (bvsge (currentBit!4054 b1!98) #b00000000000000000000000000000000) (bvslt (currentBit!4054 b1!98) #b00000000000000000000000000001000) (bvsge (currentByte!4059 b1!98) #b00000000000000000000000000000000) (or (bvslt (currentByte!4059 b1!98) (size!1689 (buf!2079 b1!98))) (and (= (currentBit!4054 b1!98) #b00000000000000000000000000000000) (= (currentByte!4059 b1!98) (size!1689 (buf!2079 b1!98)))))))))

(assert (=> b!82155 d!25896))

(declare-fun d!25904 () Bool)

(assert (=> d!25904 (= (remainingBits!0 ((_ sign_extend 32) (size!1689 (buf!2079 b1!98))) ((_ sign_extend 32) (currentByte!4059 b1!98)) ((_ sign_extend 32) (currentBit!4054 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1689 (buf!2079 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4059 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4054 b1!98)))))))

(assert (=> b!82155 d!25904))

(declare-fun d!25908 () Bool)

(declare-fun lt!130702 () (_ BitVec 64))

(declare-fun lt!130704 () (_ BitVec 64))

(assert (=> d!25908 (= (remainingBits!0 ((_ sign_extend 32) (size!1689 (buf!2079 b1!98))) ((_ sign_extend 32) (currentByte!4059 b1!98)) ((_ sign_extend 32) (currentBit!4054 b1!98))) (bvsub lt!130702 lt!130704))))

(assert (=> d!25908 (or (= (bvand lt!130702 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130704 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130702 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130702 lt!130704) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25908 (= lt!130704 (bitIndex!0 (size!1689 (buf!2079 b1!98)) (currentByte!4059 b1!98) (currentBit!4054 b1!98)))))

(declare-fun lt!130701 () (_ BitVec 64))

(declare-fun lt!130703 () (_ BitVec 64))

(assert (=> d!25908 (= lt!130702 (bvmul lt!130701 lt!130703))))

(assert (=> d!25908 (or (= lt!130701 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130703 (bvsdiv (bvmul lt!130701 lt!130703) lt!130701)))))

(assert (=> d!25908 (= lt!130703 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25908 (= lt!130701 ((_ sign_extend 32) (size!1689 (buf!2079 b1!98))))))

(declare-fun lt!130700 () Unit!5487)

(declare-fun choose!23 (BitStream!2940) Unit!5487)

(assert (=> d!25908 (= lt!130700 (choose!23 b1!98))))

(assert (=> d!25908 (= (remainingBitsBitIndexLemma!0 b1!98) lt!130700)))

(declare-fun bs!6345 () Bool)

(assert (= bs!6345 d!25908))

(assert (=> bs!6345 m!128589))

(assert (=> bs!6345 m!128595))

(declare-fun m!128631 () Bool)

(assert (=> bs!6345 m!128631))

(assert (=> b!82155 d!25908))

(declare-fun d!25912 () Bool)

(assert (=> d!25912 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1689 (buf!2079 b1!98))) ((_ sign_extend 32) (currentByte!4059 b1!98)) ((_ sign_extend 32) (currentBit!4054 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1689 (buf!2079 b1!98))) ((_ sign_extend 32) (currentByte!4059 b1!98)) ((_ sign_extend 32) (currentBit!4054 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6347 () Bool)

(assert (= bs!6347 d!25912))

(assert (=> bs!6347 m!128589))

(assert (=> b!82156 d!25912))

(check-sat (not d!25878) (not d!25912) (not d!25892) (not d!25876) (not d!25908) (not d!25882))
