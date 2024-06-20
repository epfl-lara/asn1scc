; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39022 () Bool)

(assert start!39022)

(declare-fun b!175692 () Bool)

(declare-fun e!122505 () Bool)

(declare-fun e!122508 () Bool)

(assert (=> b!175692 (= e!122505 (not e!122508))))

(declare-fun res!145487 () Bool)

(assert (=> b!175692 (=> res!145487 e!122508)))

(declare-datatypes ((array!9481 0))(
  ( (array!9482 (arr!5114 (Array (_ BitVec 32) (_ BitVec 8))) (size!4184 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7476 0))(
  ( (BitStream!7477 (buf!4624 array!9481) (currentByte!8753 (_ BitVec 32)) (currentBit!8748 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15114 0))(
  ( (tuple2!15115 (_1!8202 BitStream!7476) (_2!8202 BitStream!7476)) )
))
(declare-fun lt!270860 () tuple2!15114)

(declare-fun lt!270861 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175692 (= res!145487 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4184 (buf!4624 (_1!8202 lt!270860)))) ((_ sign_extend 32) (currentByte!8753 (_1!8202 lt!270860))) ((_ sign_extend 32) (currentBit!8748 (_1!8202 lt!270860))) lt!270861)))))

(declare-datatypes ((Unit!12679 0))(
  ( (Unit!12680) )
))
(declare-fun lt!270863 () Unit!12679)

(declare-fun thiss!1204 () BitStream!7476)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7476 array!9481 (_ BitVec 64)) Unit!12679)

(assert (=> b!175692 (= lt!270863 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4624 thiss!1204) lt!270861))))

(declare-fun reader!0 (BitStream!7476 BitStream!7476) tuple2!15114)

(assert (=> b!175692 (= lt!270860 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!7476 BitStream!7476) Bool)

(assert (=> b!175692 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!270862 () Unit!12679)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7476) Unit!12679)

(assert (=> b!175692 (= lt!270862 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun res!145489 () Bool)

(declare-fun e!122506 () Bool)

(assert (=> start!39022 (=> (not res!145489) (not e!122506))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!39022 (= res!145489 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39022 e!122506))

(assert (=> start!39022 true))

(declare-fun e!122504 () Bool)

(declare-fun inv!12 (BitStream!7476) Bool)

(assert (=> start!39022 (and (inv!12 thiss!1204) e!122504)))

(declare-fun b!175693 () Bool)

(declare-fun e!122509 () Bool)

(assert (=> b!175693 (= e!122509 e!122505)))

(declare-fun res!145486 () Bool)

(assert (=> b!175693 (=> (not res!145486) (not e!122505))))

(declare-fun lt!270859 () (_ BitVec 64))

(assert (=> b!175693 (= res!145486 (= lt!270859 (bvsub (bvadd lt!270859 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175693 (= lt!270859 (bitIndex!0 (size!4184 (buf!4624 thiss!1204)) (currentByte!8753 thiss!1204) (currentBit!8748 thiss!1204)))))

(declare-fun b!175694 () Bool)

(declare-fun res!145491 () Bool)

(assert (=> b!175694 (=> (not res!145491) (not e!122509))))

(assert (=> b!175694 (= res!145491 (= i!590 nBits!348))))

(declare-fun b!175695 () Bool)

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175695 (= e!122508 (= (bvand (bvand v!189 (onesLSBLong!0 i!590)) (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!175696 () Bool)

(declare-fun res!145490 () Bool)

(assert (=> b!175696 (=> (not res!145490) (not e!122509))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175696 (= res!145490 (invariant!0 (currentBit!8748 thiss!1204) (currentByte!8753 thiss!1204) (size!4184 (buf!4624 thiss!1204))))))

(declare-fun b!175697 () Bool)

(assert (=> b!175697 (= e!122506 e!122509)))

(declare-fun res!145488 () Bool)

(assert (=> b!175697 (=> (not res!145488) (not e!122509))))

(assert (=> b!175697 (= res!145488 (validate_offset_bits!1 ((_ sign_extend 32) (size!4184 (buf!4624 thiss!1204))) ((_ sign_extend 32) (currentByte!8753 thiss!1204)) ((_ sign_extend 32) (currentBit!8748 thiss!1204)) lt!270861))))

(assert (=> b!175697 (= lt!270861 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!175698 () Bool)

(declare-fun array_inv!3925 (array!9481) Bool)

(assert (=> b!175698 (= e!122504 (array_inv!3925 (buf!4624 thiss!1204)))))

(assert (= (and start!39022 res!145489) b!175697))

(assert (= (and b!175697 res!145488) b!175696))

(assert (= (and b!175696 res!145490) b!175694))

(assert (= (and b!175694 res!145491) b!175693))

(assert (= (and b!175693 res!145486) b!175692))

(assert (= (and b!175692 (not res!145487)) b!175695))

(assert (= start!39022 b!175698))

(declare-fun m!275875 () Bool)

(assert (=> start!39022 m!275875))

(declare-fun m!275877 () Bool)

(assert (=> b!175697 m!275877))

(declare-fun m!275879 () Bool)

(assert (=> b!175692 m!275879))

(declare-fun m!275881 () Bool)

(assert (=> b!175692 m!275881))

(declare-fun m!275883 () Bool)

(assert (=> b!175692 m!275883))

(declare-fun m!275885 () Bool)

(assert (=> b!175692 m!275885))

(declare-fun m!275887 () Bool)

(assert (=> b!175692 m!275887))

(declare-fun m!275889 () Bool)

(assert (=> b!175698 m!275889))

(declare-fun m!275891 () Bool)

(assert (=> b!175693 m!275891))

(declare-fun m!275893 () Bool)

(assert (=> b!175695 m!275893))

(declare-fun m!275895 () Bool)

(assert (=> b!175695 m!275895))

(declare-fun m!275897 () Bool)

(assert (=> b!175696 m!275897))

(check-sat (not b!175698) (not b!175696) (not b!175697) (not start!39022) (not b!175692) (not b!175695) (not b!175693))
(check-sat)
(get-model)

(declare-fun d!61985 () Bool)

(assert (=> d!61985 (= (invariant!0 (currentBit!8748 thiss!1204) (currentByte!8753 thiss!1204) (size!4184 (buf!4624 thiss!1204))) (and (bvsge (currentBit!8748 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8748 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8753 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8753 thiss!1204) (size!4184 (buf!4624 thiss!1204))) (and (= (currentBit!8748 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8753 thiss!1204) (size!4184 (buf!4624 thiss!1204)))))))))

(assert (=> b!175696 d!61985))

(declare-fun d!61987 () Bool)

(assert (=> d!61987 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8748 thiss!1204) (currentByte!8753 thiss!1204) (size!4184 (buf!4624 thiss!1204))))))

(declare-fun bs!15469 () Bool)

(assert (= bs!15469 d!61987))

(assert (=> bs!15469 m!275897))

(assert (=> start!39022 d!61987))

(declare-fun d!61989 () Bool)

(assert (=> d!61989 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!175695 d!61989))

(declare-fun d!61991 () Bool)

(assert (=> d!61991 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590)) (ite (= (bvsub #b00000000000000000000000001000000 i!590) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!590))))))))

(assert (=> b!175695 d!61991))

(declare-fun d!61993 () Bool)

(assert (=> d!61993 (= (array_inv!3925 (buf!4624 thiss!1204)) (bvsge (size!4184 (buf!4624 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!175698 d!61993))

(declare-fun d!61995 () Bool)

(declare-fun e!122530 () Bool)

(assert (=> d!61995 e!122530))

(declare-fun res!145514 () Bool)

(assert (=> d!61995 (=> (not res!145514) (not e!122530))))

(declare-fun lt!270895 () (_ BitVec 64))

(declare-fun lt!270891 () (_ BitVec 64))

(declare-fun lt!270896 () (_ BitVec 64))

(assert (=> d!61995 (= res!145514 (= lt!270891 (bvsub lt!270895 lt!270896)))))

(assert (=> d!61995 (or (= (bvand lt!270895 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!270896 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!270895 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!270895 lt!270896) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!61995 (= lt!270896 (remainingBits!0 ((_ sign_extend 32) (size!4184 (buf!4624 thiss!1204))) ((_ sign_extend 32) (currentByte!8753 thiss!1204)) ((_ sign_extend 32) (currentBit!8748 thiss!1204))))))

(declare-fun lt!270893 () (_ BitVec 64))

(declare-fun lt!270894 () (_ BitVec 64))

(assert (=> d!61995 (= lt!270895 (bvmul lt!270893 lt!270894))))

(assert (=> d!61995 (or (= lt!270893 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!270894 (bvsdiv (bvmul lt!270893 lt!270894) lt!270893)))))

(assert (=> d!61995 (= lt!270894 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61995 (= lt!270893 ((_ sign_extend 32) (size!4184 (buf!4624 thiss!1204))))))

(assert (=> d!61995 (= lt!270891 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8753 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8748 thiss!1204))))))

(assert (=> d!61995 (invariant!0 (currentBit!8748 thiss!1204) (currentByte!8753 thiss!1204) (size!4184 (buf!4624 thiss!1204)))))

(assert (=> d!61995 (= (bitIndex!0 (size!4184 (buf!4624 thiss!1204)) (currentByte!8753 thiss!1204) (currentBit!8748 thiss!1204)) lt!270891)))

(declare-fun b!175724 () Bool)

(declare-fun res!145515 () Bool)

(assert (=> b!175724 (=> (not res!145515) (not e!122530))))

(assert (=> b!175724 (= res!145515 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!270891))))

(declare-fun b!175725 () Bool)

(declare-fun lt!270892 () (_ BitVec 64))

(assert (=> b!175725 (= e!122530 (bvsle lt!270891 (bvmul lt!270892 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!175725 (or (= lt!270892 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!270892 #b0000000000000000000000000000000000000000000000000000000000001000) lt!270892)))))

(assert (=> b!175725 (= lt!270892 ((_ sign_extend 32) (size!4184 (buf!4624 thiss!1204))))))

(assert (= (and d!61995 res!145514) b!175724))

(assert (= (and b!175724 res!145515) b!175725))

(declare-fun m!275923 () Bool)

(assert (=> d!61995 m!275923))

(assert (=> d!61995 m!275897))

(assert (=> b!175693 d!61995))

(declare-fun d!62001 () Bool)

(assert (=> d!62001 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4184 (buf!4624 (_1!8202 lt!270860)))) ((_ sign_extend 32) (currentByte!8753 (_1!8202 lt!270860))) ((_ sign_extend 32) (currentBit!8748 (_1!8202 lt!270860))) lt!270861) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4184 (buf!4624 (_1!8202 lt!270860)))) ((_ sign_extend 32) (currentByte!8753 (_1!8202 lt!270860))) ((_ sign_extend 32) (currentBit!8748 (_1!8202 lt!270860)))) lt!270861))))

(declare-fun bs!15470 () Bool)

(assert (= bs!15470 d!62001))

(declare-fun m!275925 () Bool)

(assert (=> bs!15470 m!275925))

(assert (=> b!175692 d!62001))

(declare-fun d!62003 () Bool)

(assert (=> d!62003 (validate_offset_bits!1 ((_ sign_extend 32) (size!4184 (buf!4624 thiss!1204))) ((_ sign_extend 32) (currentByte!8753 thiss!1204)) ((_ sign_extend 32) (currentBit!8748 thiss!1204)) lt!270861)))

(declare-fun lt!270929 () Unit!12679)

(declare-fun choose!9 (BitStream!7476 array!9481 (_ BitVec 64) BitStream!7476) Unit!12679)

(assert (=> d!62003 (= lt!270929 (choose!9 thiss!1204 (buf!4624 thiss!1204) lt!270861 (BitStream!7477 (buf!4624 thiss!1204) (currentByte!8753 thiss!1204) (currentBit!8748 thiss!1204))))))

(assert (=> d!62003 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4624 thiss!1204) lt!270861) lt!270929)))

(declare-fun bs!15471 () Bool)

(assert (= bs!15471 d!62003))

(assert (=> bs!15471 m!275877))

(declare-fun m!275929 () Bool)

(assert (=> bs!15471 m!275929))

(assert (=> b!175692 d!62003))

(declare-fun d!62007 () Bool)

(assert (=> d!62007 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!270938 () Unit!12679)

(declare-fun choose!11 (BitStream!7476) Unit!12679)

(assert (=> d!62007 (= lt!270938 (choose!11 thiss!1204))))

(assert (=> d!62007 (= (lemmaIsPrefixRefl!0 thiss!1204) lt!270938)))

(declare-fun bs!15474 () Bool)

(assert (= bs!15474 d!62007))

(assert (=> bs!15474 m!275885))

(declare-fun m!275933 () Bool)

(assert (=> bs!15474 m!275933))

(assert (=> b!175692 d!62007))

(declare-fun d!62019 () Bool)

(declare-fun e!122541 () Bool)

(assert (=> d!62019 e!122541))

(declare-fun res!145534 () Bool)

(assert (=> d!62019 (=> (not res!145534) (not e!122541))))

(declare-fun lt!271001 () tuple2!15114)

(assert (=> d!62019 (= res!145534 (isPrefixOf!0 (_1!8202 lt!271001) (_2!8202 lt!271001)))))

(declare-fun lt!271003 () BitStream!7476)

(assert (=> d!62019 (= lt!271001 (tuple2!15115 lt!271003 thiss!1204))))

(declare-fun lt!270992 () Unit!12679)

(declare-fun lt!270995 () Unit!12679)

(assert (=> d!62019 (= lt!270992 lt!270995)))

(assert (=> d!62019 (isPrefixOf!0 lt!271003 thiss!1204)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7476 BitStream!7476 BitStream!7476) Unit!12679)

(assert (=> d!62019 (= lt!270995 (lemmaIsPrefixTransitive!0 lt!271003 thiss!1204 thiss!1204))))

(declare-fun lt!270990 () Unit!12679)

(declare-fun lt!270988 () Unit!12679)

(assert (=> d!62019 (= lt!270990 lt!270988)))

(assert (=> d!62019 (isPrefixOf!0 lt!271003 thiss!1204)))

(assert (=> d!62019 (= lt!270988 (lemmaIsPrefixTransitive!0 lt!271003 thiss!1204 thiss!1204))))

(declare-fun lt!270991 () Unit!12679)

(declare-fun e!122542 () Unit!12679)

(assert (=> d!62019 (= lt!270991 e!122542)))

(declare-fun c!9234 () Bool)

(assert (=> d!62019 (= c!9234 (not (= (size!4184 (buf!4624 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!270993 () Unit!12679)

(declare-fun lt!271007 () Unit!12679)

(assert (=> d!62019 (= lt!270993 lt!271007)))

(assert (=> d!62019 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!62019 (= lt!271007 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun lt!270998 () Unit!12679)

(declare-fun lt!271004 () Unit!12679)

(assert (=> d!62019 (= lt!270998 lt!271004)))

(assert (=> d!62019 (= lt!271004 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun lt!271002 () Unit!12679)

(declare-fun lt!271006 () Unit!12679)

(assert (=> d!62019 (= lt!271002 lt!271006)))

(assert (=> d!62019 (isPrefixOf!0 lt!271003 lt!271003)))

(assert (=> d!62019 (= lt!271006 (lemmaIsPrefixRefl!0 lt!271003))))

(declare-fun lt!271005 () Unit!12679)

(declare-fun lt!270996 () Unit!12679)

(assert (=> d!62019 (= lt!271005 lt!270996)))

(assert (=> d!62019 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!62019 (= lt!270996 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!62019 (= lt!271003 (BitStream!7477 (buf!4624 thiss!1204) (currentByte!8753 thiss!1204) (currentBit!8748 thiss!1204)))))

(assert (=> d!62019 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!62019 (= (reader!0 thiss!1204 thiss!1204) lt!271001)))

(declare-fun b!175748 () Bool)

(declare-fun res!145536 () Bool)

(assert (=> b!175748 (=> (not res!145536) (not e!122541))))

(assert (=> b!175748 (= res!145536 (isPrefixOf!0 (_2!8202 lt!271001) thiss!1204))))

(declare-fun b!175749 () Bool)

(declare-fun res!145535 () Bool)

(assert (=> b!175749 (=> (not res!145535) (not e!122541))))

(assert (=> b!175749 (= res!145535 (isPrefixOf!0 (_1!8202 lt!271001) thiss!1204))))

(declare-fun b!175750 () Bool)

(declare-fun Unit!12683 () Unit!12679)

(assert (=> b!175750 (= e!122542 Unit!12683)))

(declare-fun b!175751 () Bool)

(declare-fun lt!270989 () Unit!12679)

(assert (=> b!175751 (= e!122542 lt!270989)))

(declare-fun lt!270999 () (_ BitVec 64))

(assert (=> b!175751 (= lt!270999 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!270994 () (_ BitVec 64))

(assert (=> b!175751 (= lt!270994 (bitIndex!0 (size!4184 (buf!4624 thiss!1204)) (currentByte!8753 thiss!1204) (currentBit!8748 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9481 array!9481 (_ BitVec 64) (_ BitVec 64)) Unit!12679)

(assert (=> b!175751 (= lt!270989 (arrayBitRangesEqSymmetric!0 (buf!4624 thiss!1204) (buf!4624 thiss!1204) lt!270999 lt!270994))))

(declare-fun arrayBitRangesEq!0 (array!9481 array!9481 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175751 (arrayBitRangesEq!0 (buf!4624 thiss!1204) (buf!4624 thiss!1204) lt!270999 lt!270994)))

(declare-fun lt!270997 () (_ BitVec 64))

(declare-fun b!175752 () Bool)

(declare-fun lt!271000 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!7476 (_ BitVec 64)) BitStream!7476)

(assert (=> b!175752 (= e!122541 (= (_1!8202 lt!271001) (withMovedBitIndex!0 (_2!8202 lt!271001) (bvsub lt!270997 lt!271000))))))

(assert (=> b!175752 (or (= (bvand lt!270997 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!270997 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!270997 lt!271000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!175752 (= lt!271000 (bitIndex!0 (size!4184 (buf!4624 thiss!1204)) (currentByte!8753 thiss!1204) (currentBit!8748 thiss!1204)))))

(assert (=> b!175752 (= lt!270997 (bitIndex!0 (size!4184 (buf!4624 thiss!1204)) (currentByte!8753 thiss!1204) (currentBit!8748 thiss!1204)))))

(assert (= (and d!62019 c!9234) b!175751))

(assert (= (and d!62019 (not c!9234)) b!175750))

(assert (= (and d!62019 res!145534) b!175749))

(assert (= (and b!175749 res!145535) b!175748))

(assert (= (and b!175748 res!145536) b!175752))

(declare-fun m!275943 () Bool)

(assert (=> b!175752 m!275943))

(assert (=> b!175752 m!275891))

(assert (=> b!175752 m!275891))

(assert (=> d!62019 m!275881))

(declare-fun m!275945 () Bool)

(assert (=> d!62019 m!275945))

(declare-fun m!275947 () Bool)

(assert (=> d!62019 m!275947))

(assert (=> d!62019 m!275885))

(declare-fun m!275949 () Bool)

(assert (=> d!62019 m!275949))

(assert (=> d!62019 m!275885))

(assert (=> d!62019 m!275945))

(assert (=> d!62019 m!275881))

(declare-fun m!275951 () Bool)

(assert (=> d!62019 m!275951))

(declare-fun m!275953 () Bool)

(assert (=> d!62019 m!275953))

(assert (=> d!62019 m!275885))

(assert (=> b!175751 m!275891))

(declare-fun m!275955 () Bool)

(assert (=> b!175751 m!275955))

(declare-fun m!275957 () Bool)

(assert (=> b!175751 m!275957))

(declare-fun m!275959 () Bool)

(assert (=> b!175749 m!275959))

(declare-fun m!275961 () Bool)

(assert (=> b!175748 m!275961))

(assert (=> b!175692 d!62019))

(declare-fun d!62045 () Bool)

(declare-fun res!145555 () Bool)

(declare-fun e!122555 () Bool)

(assert (=> d!62045 (=> (not res!145555) (not e!122555))))

(assert (=> d!62045 (= res!145555 (= (size!4184 (buf!4624 thiss!1204)) (size!4184 (buf!4624 thiss!1204))))))

(assert (=> d!62045 (= (isPrefixOf!0 thiss!1204 thiss!1204) e!122555)))

(declare-fun b!175779 () Bool)

(declare-fun res!145557 () Bool)

(assert (=> b!175779 (=> (not res!145557) (not e!122555))))

(assert (=> b!175779 (= res!145557 (bvsle (bitIndex!0 (size!4184 (buf!4624 thiss!1204)) (currentByte!8753 thiss!1204) (currentBit!8748 thiss!1204)) (bitIndex!0 (size!4184 (buf!4624 thiss!1204)) (currentByte!8753 thiss!1204) (currentBit!8748 thiss!1204))))))

(declare-fun b!175780 () Bool)

(declare-fun e!122556 () Bool)

(assert (=> b!175780 (= e!122555 e!122556)))

(declare-fun res!145556 () Bool)

(assert (=> b!175780 (=> res!145556 e!122556)))

(assert (=> b!175780 (= res!145556 (= (size!4184 (buf!4624 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!175781 () Bool)

(assert (=> b!175781 (= e!122556 (arrayBitRangesEq!0 (buf!4624 thiss!1204) (buf!4624 thiss!1204) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4184 (buf!4624 thiss!1204)) (currentByte!8753 thiss!1204) (currentBit!8748 thiss!1204))))))

(assert (= (and d!62045 res!145555) b!175779))

(assert (= (and b!175779 res!145557) b!175780))

(assert (= (and b!175780 (not res!145556)) b!175781))

(assert (=> b!175779 m!275891))

(assert (=> b!175779 m!275891))

(assert (=> b!175781 m!275891))

(assert (=> b!175781 m!275891))

(declare-fun m!275963 () Bool)

(assert (=> b!175781 m!275963))

(assert (=> b!175692 d!62045))

(declare-fun d!62047 () Bool)

(assert (=> d!62047 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4184 (buf!4624 thiss!1204))) ((_ sign_extend 32) (currentByte!8753 thiss!1204)) ((_ sign_extend 32) (currentBit!8748 thiss!1204)) lt!270861) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4184 (buf!4624 thiss!1204))) ((_ sign_extend 32) (currentByte!8753 thiss!1204)) ((_ sign_extend 32) (currentBit!8748 thiss!1204))) lt!270861))))

(declare-fun bs!15484 () Bool)

(assert (= bs!15484 d!62047))

(assert (=> bs!15484 m!275923))

(assert (=> b!175697 d!62047))

(check-sat (not b!175751) (not d!62007) (not d!62001) (not b!175748) (not d!61995) (not b!175779) (not d!62047) (not d!61987) (not b!175781) (not d!62019) (not d!62003) (not b!175749) (not b!175752))
