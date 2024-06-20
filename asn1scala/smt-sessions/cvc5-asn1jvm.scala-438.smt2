; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11820 () Bool)

(assert start!11820)

(declare-datatypes ((array!2677 0))(
  ( (array!2678 (arr!1778 (Array (_ BitVec 32) (_ BitVec 8))) (size!1214 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2116 0))(
  ( (BitStream!2117 (buf!1595 array!2677) (currentByte!3213 (_ BitVec 32)) (currentBit!3208 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4051 0))(
  ( (Unit!4052) )
))
(declare-datatypes ((tuple2!5354 0))(
  ( (tuple2!5355 (_1!2788 Unit!4051) (_2!2788 BitStream!2116)) )
))
(declare-fun lt!92680 () tuple2!5354)

(declare-fun e!39066 () Bool)

(declare-fun b!58824 () Bool)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lt!92677 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!58824 (= e!39066 (= lt!92677 (bvsub (bvsub (bvadd (bitIndex!0 (size!1214 (buf!1595 (_2!2788 lt!92680))) (currentByte!3213 (_2!2788 lt!92680)) (currentBit!3208 (_2!2788 lt!92680))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!58825 () Bool)

(declare-fun e!39071 () Bool)

(declare-fun e!39062 () Bool)

(assert (=> b!58825 (= e!39071 e!39062)))

(declare-fun res!48904 () Bool)

(assert (=> b!58825 (=> res!48904 e!39062)))

(declare-fun lt!92679 () tuple2!5354)

(assert (=> b!58825 (= res!48904 (not (= (size!1214 (buf!1595 (_2!2788 lt!92680))) (size!1214 (buf!1595 (_2!2788 lt!92679))))))))

(assert (=> b!58825 e!39066))

(declare-fun res!48899 () Bool)

(assert (=> b!58825 (=> (not res!48899) (not e!39066))))

(declare-fun thiss!1379 () BitStream!2116)

(assert (=> b!58825 (= res!48899 (= (size!1214 (buf!1595 (_2!2788 lt!92679))) (size!1214 (buf!1595 thiss!1379))))))

(declare-fun b!58826 () Bool)

(declare-fun e!39069 () Bool)

(assert (=> b!58826 (= e!39069 e!39071)))

(declare-fun res!48906 () Bool)

(assert (=> b!58826 (=> res!48906 e!39071)))

(declare-fun lt!92671 () (_ BitVec 64))

(assert (=> b!58826 (= res!48906 (not (= lt!92677 (bvsub (bvadd lt!92671 to!314) i!635))))))

(assert (=> b!58826 (= lt!92677 (bitIndex!0 (size!1214 (buf!1595 (_2!2788 lt!92679))) (currentByte!3213 (_2!2788 lt!92679)) (currentBit!3208 (_2!2788 lt!92679))))))

(declare-fun b!58827 () Bool)

(declare-fun res!48894 () Bool)

(assert (=> b!58827 (=> res!48894 e!39071)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!58827 (= res!48894 (not (invariant!0 (currentBit!3208 (_2!2788 lt!92679)) (currentByte!3213 (_2!2788 lt!92679)) (size!1214 (buf!1595 (_2!2788 lt!92679))))))))

(declare-fun res!48897 () Bool)

(declare-fun e!39068 () Bool)

(assert (=> start!11820 (=> (not res!48897) (not e!39068))))

(declare-fun srcBuffer!2 () array!2677)

(assert (=> start!11820 (= res!48897 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1214 srcBuffer!2))))))))

(assert (=> start!11820 e!39068))

(assert (=> start!11820 true))

(declare-fun array_inv!1117 (array!2677) Bool)

(assert (=> start!11820 (array_inv!1117 srcBuffer!2)))

(declare-fun e!39063 () Bool)

(declare-fun inv!12 (BitStream!2116) Bool)

(assert (=> start!11820 (and (inv!12 thiss!1379) e!39063)))

(declare-fun b!58828 () Bool)

(declare-fun e!39064 () Bool)

(assert (=> b!58828 (= e!39068 (not e!39064))))

(declare-fun res!48900 () Bool)

(assert (=> b!58828 (=> res!48900 e!39064)))

(assert (=> b!58828 (= res!48900 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2116 BitStream!2116) Bool)

(assert (=> b!58828 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!92676 () Unit!4051)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2116) Unit!4051)

(assert (=> b!58828 (= lt!92676 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!58828 (= lt!92671 (bitIndex!0 (size!1214 (buf!1595 thiss!1379)) (currentByte!3213 thiss!1379) (currentBit!3208 thiss!1379)))))

(declare-fun b!58829 () Bool)

(declare-fun res!48903 () Bool)

(assert (=> b!58829 (=> (not res!48903) (not e!39068))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!58829 (= res!48903 (validate_offset_bits!1 ((_ sign_extend 32) (size!1214 (buf!1595 thiss!1379))) ((_ sign_extend 32) (currentByte!3213 thiss!1379)) ((_ sign_extend 32) (currentBit!3208 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!58830 () Bool)

(assert (=> b!58830 (= e!39063 (array_inv!1117 (buf!1595 thiss!1379)))))

(declare-datatypes ((tuple2!5356 0))(
  ( (tuple2!5357 (_1!2789 BitStream!2116) (_2!2789 BitStream!2116)) )
))
(declare-fun lt!92670 () tuple2!5356)

(declare-fun b!58831 () Bool)

(declare-fun e!39067 () Bool)

(declare-datatypes ((List!633 0))(
  ( (Nil!630) (Cons!629 (h!748 Bool) (t!1383 List!633)) )
))
(declare-fun head!452 (List!633) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2116 array!2677 (_ BitVec 64) (_ BitVec 64)) List!633)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2116 BitStream!2116 (_ BitVec 64)) List!633)

(assert (=> b!58831 (= e!39067 (= (head!452 (byteArrayBitContentToList!0 (_2!2788 lt!92680) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!452 (bitStreamReadBitsIntoList!0 (_2!2788 lt!92680) (_1!2789 lt!92670) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!58832 () Bool)

(declare-fun res!48896 () Bool)

(assert (=> b!58832 (=> res!48896 e!39071)))

(assert (=> b!58832 (= res!48896 (not (= (size!1214 (buf!1595 thiss!1379)) (size!1214 (buf!1595 (_2!2788 lt!92679))))))))

(declare-fun b!58833 () Bool)

(declare-fun e!39070 () Bool)

(assert (=> b!58833 (= e!39064 e!39070)))

(declare-fun res!48895 () Bool)

(assert (=> b!58833 (=> res!48895 e!39070)))

(assert (=> b!58833 (= res!48895 (not (isPrefixOf!0 thiss!1379 (_2!2788 lt!92680))))))

(assert (=> b!58833 (validate_offset_bits!1 ((_ sign_extend 32) (size!1214 (buf!1595 (_2!2788 lt!92680)))) ((_ sign_extend 32) (currentByte!3213 (_2!2788 lt!92680))) ((_ sign_extend 32) (currentBit!3208 (_2!2788 lt!92680))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92669 () Unit!4051)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2116 BitStream!2116 (_ BitVec 64) (_ BitVec 64)) Unit!4051)

(assert (=> b!58833 (= lt!92669 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2788 lt!92680) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2116 (_ BitVec 8) (_ BitVec 32)) tuple2!5354)

(assert (=> b!58833 (= lt!92680 (appendBitFromByte!0 thiss!1379 (select (arr!1778 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!58834 () Bool)

(declare-fun res!48901 () Bool)

(assert (=> b!58834 (=> res!48901 e!39062)))

(assert (=> b!58834 (= res!48901 (not (invariant!0 (currentBit!3208 (_2!2788 lt!92680)) (currentByte!3213 (_2!2788 lt!92680)) (size!1214 (buf!1595 (_2!2788 lt!92680))))))))

(declare-fun b!58835 () Bool)

(declare-fun res!48902 () Bool)

(assert (=> b!58835 (=> res!48902 e!39062)))

(assert (=> b!58835 (= res!48902 (not (invariant!0 (currentBit!3208 (_2!2788 lt!92680)) (currentByte!3213 (_2!2788 lt!92680)) (size!1214 (buf!1595 (_2!2788 lt!92679))))))))

(declare-fun b!58836 () Bool)

(assert (=> b!58836 (= e!39070 e!39069)))

(declare-fun res!48905 () Bool)

(assert (=> b!58836 (=> res!48905 e!39069)))

(assert (=> b!58836 (= res!48905 (not (isPrefixOf!0 (_2!2788 lt!92680) (_2!2788 lt!92679))))))

(assert (=> b!58836 (isPrefixOf!0 thiss!1379 (_2!2788 lt!92679))))

(declare-fun lt!92672 () Unit!4051)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2116 BitStream!2116 BitStream!2116) Unit!4051)

(assert (=> b!58836 (= lt!92672 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2788 lt!92680) (_2!2788 lt!92679)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2116 array!2677 (_ BitVec 64) (_ BitVec 64)) tuple2!5354)

(assert (=> b!58836 (= lt!92679 (appendBitsMSBFirstLoop!0 (_2!2788 lt!92680) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!58836 e!39067))

(declare-fun res!48898 () Bool)

(assert (=> b!58836 (=> (not res!48898) (not e!39067))))

(assert (=> b!58836 (= res!48898 (validate_offset_bits!1 ((_ sign_extend 32) (size!1214 (buf!1595 (_2!2788 lt!92680)))) ((_ sign_extend 32) (currentByte!3213 thiss!1379)) ((_ sign_extend 32) (currentBit!3208 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92673 () Unit!4051)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2116 array!2677 (_ BitVec 64)) Unit!4051)

(assert (=> b!58836 (= lt!92673 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1595 (_2!2788 lt!92680)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!2116 BitStream!2116) tuple2!5356)

(assert (=> b!58836 (= lt!92670 (reader!0 thiss!1379 (_2!2788 lt!92680)))))

(declare-fun b!58837 () Bool)

(assert (=> b!58837 (= e!39062 true)))

(declare-fun lt!92675 () tuple2!5356)

(assert (=> b!58837 (= lt!92675 (reader!0 (_2!2788 lt!92680) (_2!2788 lt!92679)))))

(assert (=> b!58837 (validate_offset_bits!1 ((_ sign_extend 32) (size!1214 (buf!1595 (_2!2788 lt!92679)))) ((_ sign_extend 32) (currentByte!3213 thiss!1379)) ((_ sign_extend 32) (currentBit!3208 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!92674 () Unit!4051)

(assert (=> b!58837 (= lt!92674 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1595 (_2!2788 lt!92679)) (bvsub to!314 i!635)))))

(declare-fun lt!92678 () tuple2!5356)

(assert (=> b!58837 (= lt!92678 (reader!0 thiss!1379 (_2!2788 lt!92679)))))

(assert (= (and start!11820 res!48897) b!58829))

(assert (= (and b!58829 res!48903) b!58828))

(assert (= (and b!58828 (not res!48900)) b!58833))

(assert (= (and b!58833 (not res!48895)) b!58836))

(assert (= (and b!58836 res!48898) b!58831))

(assert (= (and b!58836 (not res!48905)) b!58826))

(assert (= (and b!58826 (not res!48906)) b!58827))

(assert (= (and b!58827 (not res!48894)) b!58832))

(assert (= (and b!58832 (not res!48896)) b!58825))

(assert (= (and b!58825 res!48899) b!58824))

(assert (= (and b!58825 (not res!48904)) b!58834))

(assert (= (and b!58834 (not res!48901)) b!58835))

(assert (= (and b!58835 (not res!48902)) b!58837))

(assert (= start!11820 b!58830))

(declare-fun m!92641 () Bool)

(assert (=> b!58833 m!92641))

(declare-fun m!92643 () Bool)

(assert (=> b!58833 m!92643))

(declare-fun m!92645 () Bool)

(assert (=> b!58833 m!92645))

(declare-fun m!92647 () Bool)

(assert (=> b!58833 m!92647))

(declare-fun m!92649 () Bool)

(assert (=> b!58833 m!92649))

(assert (=> b!58833 m!92645))

(declare-fun m!92651 () Bool)

(assert (=> start!11820 m!92651))

(declare-fun m!92653 () Bool)

(assert (=> start!11820 m!92653))

(declare-fun m!92655 () Bool)

(assert (=> b!58834 m!92655))

(declare-fun m!92657 () Bool)

(assert (=> b!58828 m!92657))

(declare-fun m!92659 () Bool)

(assert (=> b!58828 m!92659))

(declare-fun m!92661 () Bool)

(assert (=> b!58828 m!92661))

(declare-fun m!92663 () Bool)

(assert (=> b!58826 m!92663))

(declare-fun m!92665 () Bool)

(assert (=> b!58829 m!92665))

(declare-fun m!92667 () Bool)

(assert (=> b!58824 m!92667))

(declare-fun m!92669 () Bool)

(assert (=> b!58837 m!92669))

(declare-fun m!92671 () Bool)

(assert (=> b!58837 m!92671))

(declare-fun m!92673 () Bool)

(assert (=> b!58837 m!92673))

(declare-fun m!92675 () Bool)

(assert (=> b!58837 m!92675))

(declare-fun m!92677 () Bool)

(assert (=> b!58827 m!92677))

(declare-fun m!92679 () Bool)

(assert (=> b!58830 m!92679))

(declare-fun m!92681 () Bool)

(assert (=> b!58836 m!92681))

(declare-fun m!92683 () Bool)

(assert (=> b!58836 m!92683))

(declare-fun m!92685 () Bool)

(assert (=> b!58836 m!92685))

(declare-fun m!92687 () Bool)

(assert (=> b!58836 m!92687))

(declare-fun m!92689 () Bool)

(assert (=> b!58836 m!92689))

(declare-fun m!92691 () Bool)

(assert (=> b!58836 m!92691))

(declare-fun m!92693 () Bool)

(assert (=> b!58836 m!92693))

(declare-fun m!92695 () Bool)

(assert (=> b!58835 m!92695))

(declare-fun m!92697 () Bool)

(assert (=> b!58831 m!92697))

(assert (=> b!58831 m!92697))

(declare-fun m!92699 () Bool)

(assert (=> b!58831 m!92699))

(declare-fun m!92701 () Bool)

(assert (=> b!58831 m!92701))

(assert (=> b!58831 m!92701))

(declare-fun m!92703 () Bool)

(assert (=> b!58831 m!92703))

(push 1)

(assert (not b!58827))

(assert (not b!58836))

(assert (not b!58826))

(assert (not b!58824))

(assert (not b!58834))

(assert (not b!58835))

(assert (not b!58837))

(assert (not b!58831))

(assert (not start!11820))

(assert (not b!58830))

(assert (not b!58828))

(assert (not b!58829))

(assert (not b!58833))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

