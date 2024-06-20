; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16572 () Bool)

(assert start!16572)

(declare-fun b!82286 () Bool)

(declare-fun e!54335 () Bool)

(declare-fun e!54334 () Bool)

(assert (=> b!82286 (= e!54335 (not e!54334))))

(declare-fun res!67808 () Bool)

(assert (=> b!82286 (=> res!67808 e!54334)))

(declare-fun lt!130839 () (_ BitVec 64))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun lt!130837 () (_ BitVec 64))

(assert (=> b!82286 (= res!67808 (bvsgt lt!130839 (bvsub lt!130837 b1ValidateOffsetBits!11)))))

(declare-datatypes ((array!3703 0))(
  ( (array!3704 (arr!2332 (Array (_ BitVec 32) (_ BitVec 8))) (size!1695 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2952 0))(
  ( (BitStream!2953 (buf!2085 array!3703) (currentByte!4077 (_ BitVec 32)) (currentBit!4072 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!2952)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!82286 (= (remainingBits!0 ((_ sign_extend 32) (size!1695 (buf!2085 b1!98))) ((_ sign_extend 32) (currentByte!4077 b1!98)) ((_ sign_extend 32) (currentBit!4072 b1!98))) (bvsub lt!130837 lt!130839))))

(assert (=> b!82286 (= lt!130837 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1695 (buf!2085 b1!98)))))))

(declare-datatypes ((Unit!5499 0))(
  ( (Unit!5500) )
))
(declare-fun lt!130838 () Unit!5499)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2952) Unit!5499)

(assert (=> b!82286 (= lt!130838 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!82287 () Bool)

(declare-fun e!54339 () Bool)

(assert (=> b!82287 (= e!54339 e!54335)))

(declare-fun res!67810 () Bool)

(assert (=> b!82287 (=> (not res!67810) (not e!54335))))

(declare-fun lt!130835 () (_ BitVec 64))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(assert (=> b!82287 (= res!67810 (= (bvadd lt!130839 b1b2Diff!1) lt!130835))))

(declare-fun b2!98 () BitStream!2952)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!82287 (= lt!130835 (bitIndex!0 (size!1695 (buf!2085 b2!98)) (currentByte!4077 b2!98) (currentBit!4072 b2!98)))))

(assert (=> b!82287 (= lt!130839 (bitIndex!0 (size!1695 (buf!2085 b1!98)) (currentByte!4077 b1!98) (currentBit!4072 b1!98)))))

(declare-fun b!82288 () Bool)

(declare-fun e!54333 () Bool)

(declare-fun array_inv!1541 (array!3703) Bool)

(assert (=> b!82288 (= e!54333 (array_inv!1541 (buf!2085 b1!98)))))

(declare-fun b!82289 () Bool)

(declare-fun e!54336 () Bool)

(assert (=> b!82289 (= e!54336 (array_inv!1541 (buf!2085 b2!98)))))

(declare-fun b!82290 () Bool)

(declare-fun res!67809 () Bool)

(assert (=> b!82290 (=> (not res!67809) (not e!54339))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!82290 (= res!67809 (validate_offset_bits!1 ((_ sign_extend 32) (size!1695 (buf!2085 b1!98))) ((_ sign_extend 32) (currentByte!4077 b1!98)) ((_ sign_extend 32) (currentBit!4072 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!82291 () Bool)

(assert (=> b!82291 (= e!54334 (or (bvsgt ((_ sign_extend 32) (size!1695 (buf!2085 b2!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4077 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4072 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (and (bvsge ((_ sign_extend 32) (size!1695 (buf!2085 b2!98))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4077 b2!98)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4072 b2!98)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!82291 (= (remainingBits!0 ((_ sign_extend 32) (size!1695 (buf!2085 b2!98))) ((_ sign_extend 32) (currentByte!4077 b2!98)) ((_ sign_extend 32) (currentBit!4072 b2!98))) (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1695 (buf!2085 b2!98)))) lt!130835))))

(declare-fun lt!130836 () Unit!5499)

(assert (=> b!82291 (= lt!130836 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun res!67807 () Bool)

(assert (=> start!16572 (=> (not res!67807) (not e!54339))))

(assert (=> start!16572 (= res!67807 (and (= (size!1695 (buf!2085 b1!98)) (size!1695 (buf!2085 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16572 e!54339))

(declare-fun inv!12 (BitStream!2952) Bool)

(assert (=> start!16572 (and (inv!12 b1!98) e!54333)))

(assert (=> start!16572 (and (inv!12 b2!98) e!54336)))

(assert (=> start!16572 true))

(assert (= (and start!16572 res!67807) b!82290))

(assert (= (and b!82290 res!67809) b!82287))

(assert (= (and b!82287 res!67810) b!82286))

(assert (= (and b!82286 (not res!67808)) b!82291))

(assert (= start!16572 b!82288))

(assert (= start!16572 b!82289))

(declare-fun m!128731 () Bool)

(assert (=> b!82289 m!128731))

(declare-fun m!128733 () Bool)

(assert (=> b!82287 m!128733))

(declare-fun m!128735 () Bool)

(assert (=> b!82287 m!128735))

(declare-fun m!128737 () Bool)

(assert (=> b!82286 m!128737))

(declare-fun m!128739 () Bool)

(assert (=> b!82286 m!128739))

(declare-fun m!128741 () Bool)

(assert (=> b!82291 m!128741))

(declare-fun m!128743 () Bool)

(assert (=> b!82291 m!128743))

(declare-fun m!128745 () Bool)

(assert (=> b!82290 m!128745))

(declare-fun m!128747 () Bool)

(assert (=> b!82288 m!128747))

(declare-fun m!128749 () Bool)

(assert (=> start!16572 m!128749))

(declare-fun m!128751 () Bool)

(assert (=> start!16572 m!128751))

(check-sat (not b!82288) (not b!82289) (not b!82286) (not start!16572) (not b!82287) (not b!82291) (not b!82290))
(check-sat)
(get-model)

(declare-fun d!25938 () Bool)

(assert (=> d!25938 (= (array_inv!1541 (buf!2085 b1!98)) (bvsge (size!1695 (buf!2085 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!82288 d!25938))

(declare-fun d!25940 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!25940 (= (inv!12 b1!98) (invariant!0 (currentBit!4072 b1!98) (currentByte!4077 b1!98) (size!1695 (buf!2085 b1!98))))))

(declare-fun bs!6358 () Bool)

(assert (= bs!6358 d!25940))

(declare-fun m!128775 () Bool)

(assert (=> bs!6358 m!128775))

(assert (=> start!16572 d!25940))

(declare-fun d!25942 () Bool)

(assert (=> d!25942 (= (inv!12 b2!98) (invariant!0 (currentBit!4072 b2!98) (currentByte!4077 b2!98) (size!1695 (buf!2085 b2!98))))))

(declare-fun bs!6359 () Bool)

(assert (= bs!6359 d!25942))

(declare-fun m!128777 () Bool)

(assert (=> bs!6359 m!128777))

(assert (=> start!16572 d!25942))

(declare-fun d!25944 () Bool)

(assert (=> d!25944 (= (array_inv!1541 (buf!2085 b2!98)) (bvsge (size!1695 (buf!2085 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!82289 d!25944))

(declare-fun d!25946 () Bool)

(assert (=> d!25946 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1695 (buf!2085 b1!98))) ((_ sign_extend 32) (currentByte!4077 b1!98)) ((_ sign_extend 32) (currentBit!4072 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1695 (buf!2085 b1!98))) ((_ sign_extend 32) (currentByte!4077 b1!98)) ((_ sign_extend 32) (currentBit!4072 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6360 () Bool)

(assert (= bs!6360 d!25946))

(assert (=> bs!6360 m!128737))

(assert (=> b!82290 d!25946))

(declare-fun d!25948 () Bool)

(assert (=> d!25948 (= (remainingBits!0 ((_ sign_extend 32) (size!1695 (buf!2085 b2!98))) ((_ sign_extend 32) (currentByte!4077 b2!98)) ((_ sign_extend 32) (currentBit!4072 b2!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1695 (buf!2085 b2!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4077 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4072 b2!98)))))))

(assert (=> b!82291 d!25948))

(declare-fun d!25950 () Bool)

(declare-fun lt!130865 () (_ BitVec 64))

(declare-fun lt!130866 () (_ BitVec 64))

(assert (=> d!25950 (= (remainingBits!0 ((_ sign_extend 32) (size!1695 (buf!2085 b2!98))) ((_ sign_extend 32) (currentByte!4077 b2!98)) ((_ sign_extend 32) (currentBit!4072 b2!98))) (bvsub lt!130865 lt!130866))))

(assert (=> d!25950 (or (= (bvand lt!130865 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130866 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130865 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130865 lt!130866) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25950 (= lt!130866 (bitIndex!0 (size!1695 (buf!2085 b2!98)) (currentByte!4077 b2!98) (currentBit!4072 b2!98)))))

(declare-fun lt!130869 () (_ BitVec 64))

(declare-fun lt!130867 () (_ BitVec 64))

(assert (=> d!25950 (= lt!130865 (bvmul lt!130869 lt!130867))))

(assert (=> d!25950 (or (= lt!130869 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130867 (bvsdiv (bvmul lt!130869 lt!130867) lt!130869)))))

(assert (=> d!25950 (= lt!130867 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25950 (= lt!130869 ((_ sign_extend 32) (size!1695 (buf!2085 b2!98))))))

(declare-fun lt!130868 () Unit!5499)

(declare-fun choose!23 (BitStream!2952) Unit!5499)

(assert (=> d!25950 (= lt!130868 (choose!23 b2!98))))

(assert (=> d!25950 (= (remainingBitsBitIndexLemma!0 b2!98) lt!130868)))

(declare-fun bs!6361 () Bool)

(assert (= bs!6361 d!25950))

(assert (=> bs!6361 m!128741))

(assert (=> bs!6361 m!128733))

(declare-fun m!128779 () Bool)

(assert (=> bs!6361 m!128779))

(assert (=> b!82291 d!25950))

(declare-fun d!25952 () Bool)

(assert (=> d!25952 (= (remainingBits!0 ((_ sign_extend 32) (size!1695 (buf!2085 b1!98))) ((_ sign_extend 32) (currentByte!4077 b1!98)) ((_ sign_extend 32) (currentBit!4072 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1695 (buf!2085 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4077 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4072 b1!98)))))))

(assert (=> b!82286 d!25952))

(declare-fun d!25954 () Bool)

(declare-fun lt!130870 () (_ BitVec 64))

(declare-fun lt!130871 () (_ BitVec 64))

(assert (=> d!25954 (= (remainingBits!0 ((_ sign_extend 32) (size!1695 (buf!2085 b1!98))) ((_ sign_extend 32) (currentByte!4077 b1!98)) ((_ sign_extend 32) (currentBit!4072 b1!98))) (bvsub lt!130870 lt!130871))))

(assert (=> d!25954 (or (= (bvand lt!130870 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130871 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130870 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130870 lt!130871) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25954 (= lt!130871 (bitIndex!0 (size!1695 (buf!2085 b1!98)) (currentByte!4077 b1!98) (currentBit!4072 b1!98)))))

(declare-fun lt!130874 () (_ BitVec 64))

(declare-fun lt!130872 () (_ BitVec 64))

(assert (=> d!25954 (= lt!130870 (bvmul lt!130874 lt!130872))))

(assert (=> d!25954 (or (= lt!130874 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130872 (bvsdiv (bvmul lt!130874 lt!130872) lt!130874)))))

(assert (=> d!25954 (= lt!130872 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25954 (= lt!130874 ((_ sign_extend 32) (size!1695 (buf!2085 b1!98))))))

(declare-fun lt!130873 () Unit!5499)

(assert (=> d!25954 (= lt!130873 (choose!23 b1!98))))

(assert (=> d!25954 (= (remainingBitsBitIndexLemma!0 b1!98) lt!130873)))

(declare-fun bs!6362 () Bool)

(assert (= bs!6362 d!25954))

(assert (=> bs!6362 m!128737))

(assert (=> bs!6362 m!128735))

(declare-fun m!128781 () Bool)

(assert (=> bs!6362 m!128781))

(assert (=> b!82286 d!25954))

(declare-fun d!25956 () Bool)

(declare-fun e!54363 () Bool)

(assert (=> d!25956 e!54363))

(declare-fun res!67827 () Bool)

(assert (=> d!25956 (=> (not res!67827) (not e!54363))))

(declare-fun lt!130892 () (_ BitVec 64))

(declare-fun lt!130891 () (_ BitVec 64))

(declare-fun lt!130889 () (_ BitVec 64))

(assert (=> d!25956 (= res!67827 (= lt!130892 (bvsub lt!130889 lt!130891)))))

(assert (=> d!25956 (or (= (bvand lt!130889 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130891 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130889 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130889 lt!130891) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25956 (= lt!130891 (remainingBits!0 ((_ sign_extend 32) (size!1695 (buf!2085 b2!98))) ((_ sign_extend 32) (currentByte!4077 b2!98)) ((_ sign_extend 32) (currentBit!4072 b2!98))))))

(declare-fun lt!130888 () (_ BitVec 64))

(declare-fun lt!130890 () (_ BitVec 64))

(assert (=> d!25956 (= lt!130889 (bvmul lt!130888 lt!130890))))

(assert (=> d!25956 (or (= lt!130888 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130890 (bvsdiv (bvmul lt!130888 lt!130890) lt!130888)))))

(assert (=> d!25956 (= lt!130890 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25956 (= lt!130888 ((_ sign_extend 32) (size!1695 (buf!2085 b2!98))))))

(assert (=> d!25956 (= lt!130892 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4077 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4072 b2!98))))))

(assert (=> d!25956 (invariant!0 (currentBit!4072 b2!98) (currentByte!4077 b2!98) (size!1695 (buf!2085 b2!98)))))

(assert (=> d!25956 (= (bitIndex!0 (size!1695 (buf!2085 b2!98)) (currentByte!4077 b2!98) (currentBit!4072 b2!98)) lt!130892)))

(declare-fun b!82315 () Bool)

(declare-fun res!67828 () Bool)

(assert (=> b!82315 (=> (not res!67828) (not e!54363))))

(assert (=> b!82315 (= res!67828 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!130892))))

(declare-fun b!82316 () Bool)

(declare-fun lt!130887 () (_ BitVec 64))

(assert (=> b!82316 (= e!54363 (bvsle lt!130892 (bvmul lt!130887 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82316 (or (= lt!130887 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!130887 #b0000000000000000000000000000000000000000000000000000000000001000) lt!130887)))))

(assert (=> b!82316 (= lt!130887 ((_ sign_extend 32) (size!1695 (buf!2085 b2!98))))))

(assert (= (and d!25956 res!67827) b!82315))

(assert (= (and b!82315 res!67828) b!82316))

(assert (=> d!25956 m!128741))

(assert (=> d!25956 m!128777))

(assert (=> b!82287 d!25956))

(declare-fun d!25966 () Bool)

(declare-fun e!54364 () Bool)

(assert (=> d!25966 e!54364))

(declare-fun res!67829 () Bool)

(assert (=> d!25966 (=> (not res!67829) (not e!54364))))

(declare-fun lt!130895 () (_ BitVec 64))

(declare-fun lt!130898 () (_ BitVec 64))

(declare-fun lt!130897 () (_ BitVec 64))

(assert (=> d!25966 (= res!67829 (= lt!130898 (bvsub lt!130895 lt!130897)))))

(assert (=> d!25966 (or (= (bvand lt!130895 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130897 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130895 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130895 lt!130897) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25966 (= lt!130897 (remainingBits!0 ((_ sign_extend 32) (size!1695 (buf!2085 b1!98))) ((_ sign_extend 32) (currentByte!4077 b1!98)) ((_ sign_extend 32) (currentBit!4072 b1!98))))))

(declare-fun lt!130894 () (_ BitVec 64))

(declare-fun lt!130896 () (_ BitVec 64))

(assert (=> d!25966 (= lt!130895 (bvmul lt!130894 lt!130896))))

(assert (=> d!25966 (or (= lt!130894 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130896 (bvsdiv (bvmul lt!130894 lt!130896) lt!130894)))))

(assert (=> d!25966 (= lt!130896 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25966 (= lt!130894 ((_ sign_extend 32) (size!1695 (buf!2085 b1!98))))))

(assert (=> d!25966 (= lt!130898 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4077 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4072 b1!98))))))

(assert (=> d!25966 (invariant!0 (currentBit!4072 b1!98) (currentByte!4077 b1!98) (size!1695 (buf!2085 b1!98)))))

(assert (=> d!25966 (= (bitIndex!0 (size!1695 (buf!2085 b1!98)) (currentByte!4077 b1!98) (currentBit!4072 b1!98)) lt!130898)))

(declare-fun b!82317 () Bool)

(declare-fun res!67830 () Bool)

(assert (=> b!82317 (=> (not res!67830) (not e!54364))))

(assert (=> b!82317 (= res!67830 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!130898))))

(declare-fun b!82318 () Bool)

(declare-fun lt!130893 () (_ BitVec 64))

(assert (=> b!82318 (= e!54364 (bvsle lt!130898 (bvmul lt!130893 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82318 (or (= lt!130893 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!130893 #b0000000000000000000000000000000000000000000000000000000000001000) lt!130893)))))

(assert (=> b!82318 (= lt!130893 ((_ sign_extend 32) (size!1695 (buf!2085 b1!98))))))

(assert (= (and d!25966 res!67829) b!82317))

(assert (= (and b!82317 res!67830) b!82318))

(assert (=> d!25966 m!128737))

(assert (=> d!25966 m!128775))

(assert (=> b!82287 d!25966))

(check-sat (not d!25942) (not d!25956) (not d!25950) (not d!25954) (not d!25946) (not d!25940) (not d!25966))
