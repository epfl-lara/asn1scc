; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25680 () Bool)

(assert start!25680)

(declare-fun b!131047 () Bool)

(declare-fun res!108684 () Bool)

(declare-fun e!86872 () Bool)

(assert (=> b!131047 (=> (not res!108684) (not e!86872))))

(declare-datatypes ((array!6060 0))(
  ( (array!6061 (arr!3367 (Array (_ BitVec 32) (_ BitVec 8))) (size!2744 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4752 0))(
  ( (BitStream!4753 (buf!3105 array!6060) (currentByte!5878 (_ BitVec 32)) (currentBit!5873 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4752)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!131047 (= res!108684 (invariant!0 (currentBit!5873 thiss!1634) (currentByte!5878 thiss!1634) (size!2744 (buf!3105 thiss!1634))))))

(declare-fun b!131048 () Bool)

(declare-fun res!108693 () Bool)

(declare-fun e!86869 () Bool)

(assert (=> b!131048 (=> (not res!108693) (not e!86869))))

(declare-datatypes ((Unit!8102 0))(
  ( (Unit!8103) )
))
(declare-datatypes ((tuple2!11316 0))(
  ( (tuple2!11317 (_1!5958 Unit!8102) (_2!5958 BitStream!4752)) )
))
(declare-fun lt!202106 () tuple2!11316)

(declare-fun lt!202113 () tuple2!11316)

(declare-fun isPrefixOf!0 (BitStream!4752 BitStream!4752) Bool)

(assert (=> b!131048 (= res!108693 (isPrefixOf!0 (_2!5958 lt!202106) (_2!5958 lt!202113)))))

(declare-fun b!131049 () Bool)

(declare-fun e!86871 () Bool)

(assert (=> b!131049 (= e!86871 e!86869)))

(declare-fun res!108688 () Bool)

(assert (=> b!131049 (=> (not res!108688) (not e!86869))))

(declare-fun lt!202109 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!131049 (= res!108688 (= (bitIndex!0 (size!2744 (buf!3105 (_2!5958 lt!202113))) (currentByte!5878 (_2!5958 lt!202113)) (currentBit!5873 (_2!5958 lt!202113))) (bvadd (bitIndex!0 (size!2744 (buf!3105 (_2!5958 lt!202106))) (currentByte!5878 (_2!5958 lt!202106)) (currentBit!5873 (_2!5958 lt!202106))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!202109))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!131049 (= lt!202109 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-datatypes ((tuple2!11318 0))(
  ( (tuple2!11319 (_1!5959 BitStream!4752) (_2!5959 BitStream!4752)) )
))
(declare-fun lt!202101 () tuple2!11318)

(declare-fun arr!237 () array!6060)

(declare-fun b!131050 () Bool)

(declare-datatypes ((tuple2!11320 0))(
  ( (tuple2!11321 (_1!5960 BitStream!4752) (_2!5960 (_ BitVec 8))) )
))
(declare-fun lt!202107 () tuple2!11320)

(declare-fun e!86865 () Bool)

(assert (=> b!131050 (= e!86865 (and (= (_2!5960 lt!202107) (select (arr!3367 arr!237) from!447)) (= (_1!5960 lt!202107) (_2!5959 lt!202101))))))

(declare-fun readBytePure!0 (BitStream!4752) tuple2!11320)

(assert (=> b!131050 (= lt!202107 (readBytePure!0 (_1!5959 lt!202101)))))

(declare-fun reader!0 (BitStream!4752 BitStream!4752) tuple2!11318)

(assert (=> b!131050 (= lt!202101 (reader!0 thiss!1634 (_2!5958 lt!202106)))))

(declare-fun b!131051 () Bool)

(declare-fun res!108694 () Bool)

(assert (=> b!131051 (=> (not res!108694) (not e!86865))))

(assert (=> b!131051 (= res!108694 (isPrefixOf!0 thiss!1634 (_2!5958 lt!202106)))))

(declare-fun b!131052 () Bool)

(declare-fun e!86873 () Bool)

(assert (=> b!131052 (= e!86869 (not e!86873))))

(declare-fun res!108682 () Bool)

(assert (=> b!131052 (=> res!108682 e!86873)))

(declare-datatypes ((tuple2!11322 0))(
  ( (tuple2!11323 (_1!5961 BitStream!4752) (_2!5961 array!6060)) )
))
(declare-fun lt!202115 () tuple2!11322)

(declare-fun lt!202103 () tuple2!11318)

(assert (=> b!131052 (= res!108682 (or (not (= (size!2744 (_2!5961 lt!202115)) (size!2744 arr!237))) (not (= (_1!5961 lt!202115) (_2!5959 lt!202103)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4752 array!6060 (_ BitVec 32) (_ BitVec 32)) tuple2!11322)

(assert (=> b!131052 (= lt!202115 (readByteArrayLoopPure!0 (_1!5959 lt!202103) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!131052 (validate_offset_bits!1 ((_ sign_extend 32) (size!2744 (buf!3105 (_2!5958 lt!202113)))) ((_ sign_extend 32) (currentByte!5878 (_2!5958 lt!202106))) ((_ sign_extend 32) (currentBit!5873 (_2!5958 lt!202106))) lt!202109)))

(declare-fun lt!202099 () Unit!8102)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4752 array!6060 (_ BitVec 64)) Unit!8102)

(assert (=> b!131052 (= lt!202099 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5958 lt!202106) (buf!3105 (_2!5958 lt!202113)) lt!202109))))

(assert (=> b!131052 (= lt!202103 (reader!0 (_2!5958 lt!202106) (_2!5958 lt!202113)))))

(declare-fun b!131053 () Bool)

(declare-fun arrayRangesEq!147 (array!6060 array!6060 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!131053 (= e!86873 (not (arrayRangesEq!147 arr!237 (_2!5961 lt!202115) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!131054 () Bool)

(declare-fun e!86870 () Bool)

(declare-fun array_inv!2533 (array!6060) Bool)

(assert (=> b!131054 (= e!86870 (array_inv!2533 (buf!3105 thiss!1634)))))

(declare-fun b!131055 () Bool)

(declare-fun res!108691 () Bool)

(assert (=> b!131055 (=> (not res!108691) (not e!86872))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!131055 (= res!108691 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2744 (buf!3105 thiss!1634))) ((_ sign_extend 32) (currentByte!5878 thiss!1634)) ((_ sign_extend 32) (currentBit!5873 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!131056 () Bool)

(declare-fun res!108689 () Bool)

(assert (=> b!131056 (=> (not res!108689) (not e!86872))))

(assert (=> b!131056 (= res!108689 (bvslt from!447 to!404))))

(declare-fun b!131057 () Bool)

(declare-fun lt!202111 () tuple2!11318)

(assert (=> b!131057 (= e!86872 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!2744 (buf!3105 (_1!5959 lt!202111)))) ((_ sign_extend 32) (currentByte!5878 (_1!5959 lt!202111))) ((_ sign_extend 32) (currentBit!5873 (_1!5959 lt!202111))) (bvsub to!404 from!447))))))

(assert (=> b!131057 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2744 (buf!3105 (_2!5958 lt!202113)))) ((_ sign_extend 32) (currentByte!5878 thiss!1634)) ((_ sign_extend 32) (currentBit!5873 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!202102 () Unit!8102)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4752 array!6060 (_ BitVec 32)) Unit!8102)

(assert (=> b!131057 (= lt!202102 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3105 (_2!5958 lt!202113)) (bvsub to!404 from!447)))))

(assert (=> b!131057 (= (_2!5960 (readBytePure!0 (_1!5959 lt!202111))) (select (arr!3367 arr!237) from!447))))

(declare-fun lt!202104 () tuple2!11318)

(assert (=> b!131057 (= lt!202104 (reader!0 (_2!5958 lt!202106) (_2!5958 lt!202113)))))

(assert (=> b!131057 (= lt!202111 (reader!0 thiss!1634 (_2!5958 lt!202113)))))

(declare-fun e!86866 () Bool)

(assert (=> b!131057 e!86866))

(declare-fun res!108692 () Bool)

(assert (=> b!131057 (=> (not res!108692) (not e!86866))))

(declare-fun lt!202110 () tuple2!11320)

(declare-fun lt!202105 () tuple2!11320)

(assert (=> b!131057 (= res!108692 (= (bitIndex!0 (size!2744 (buf!3105 (_1!5960 lt!202110))) (currentByte!5878 (_1!5960 lt!202110)) (currentBit!5873 (_1!5960 lt!202110))) (bitIndex!0 (size!2744 (buf!3105 (_1!5960 lt!202105))) (currentByte!5878 (_1!5960 lt!202105)) (currentBit!5873 (_1!5960 lt!202105)))))))

(declare-fun lt!202100 () Unit!8102)

(declare-fun lt!202108 () BitStream!4752)

(declare-fun readBytePrefixLemma!0 (BitStream!4752 BitStream!4752) Unit!8102)

(assert (=> b!131057 (= lt!202100 (readBytePrefixLemma!0 lt!202108 (_2!5958 lt!202113)))))

(assert (=> b!131057 (= lt!202105 (readBytePure!0 (BitStream!4753 (buf!3105 (_2!5958 lt!202113)) (currentByte!5878 thiss!1634) (currentBit!5873 thiss!1634))))))

(assert (=> b!131057 (= lt!202110 (readBytePure!0 lt!202108))))

(assert (=> b!131057 (= lt!202108 (BitStream!4753 (buf!3105 (_2!5958 lt!202106)) (currentByte!5878 thiss!1634) (currentBit!5873 thiss!1634)))))

(declare-fun e!86867 () Bool)

(assert (=> b!131057 e!86867))

(declare-fun res!108683 () Bool)

(assert (=> b!131057 (=> (not res!108683) (not e!86867))))

(assert (=> b!131057 (= res!108683 (isPrefixOf!0 thiss!1634 (_2!5958 lt!202113)))))

(declare-fun lt!202114 () Unit!8102)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4752 BitStream!4752 BitStream!4752) Unit!8102)

(assert (=> b!131057 (= lt!202114 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5958 lt!202106) (_2!5958 lt!202113)))))

(assert (=> b!131057 e!86871))

(declare-fun res!108687 () Bool)

(assert (=> b!131057 (=> (not res!108687) (not e!86871))))

(assert (=> b!131057 (= res!108687 (= (size!2744 (buf!3105 (_2!5958 lt!202106))) (size!2744 (buf!3105 (_2!5958 lt!202113)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4752 array!6060 (_ BitVec 32) (_ BitVec 32)) tuple2!11316)

(assert (=> b!131057 (= lt!202113 (appendByteArrayLoop!0 (_2!5958 lt!202106) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!131057 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2744 (buf!3105 (_2!5958 lt!202106)))) ((_ sign_extend 32) (currentByte!5878 (_2!5958 lt!202106))) ((_ sign_extend 32) (currentBit!5873 (_2!5958 lt!202106))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!202112 () Unit!8102)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4752 BitStream!4752 (_ BitVec 64) (_ BitVec 32)) Unit!8102)

(assert (=> b!131057 (= lt!202112 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5958 lt!202106) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!131057 e!86865))

(declare-fun res!108685 () Bool)

(assert (=> b!131057 (=> (not res!108685) (not e!86865))))

(assert (=> b!131057 (= res!108685 (= (size!2744 (buf!3105 thiss!1634)) (size!2744 (buf!3105 (_2!5958 lt!202106)))))))

(declare-fun appendByte!0 (BitStream!4752 (_ BitVec 8)) tuple2!11316)

(assert (=> b!131057 (= lt!202106 (appendByte!0 thiss!1634 (select (arr!3367 arr!237) from!447)))))

(declare-fun res!108686 () Bool)

(assert (=> start!25680 (=> (not res!108686) (not e!86872))))

(assert (=> start!25680 (= res!108686 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2744 arr!237))))))

(assert (=> start!25680 e!86872))

(assert (=> start!25680 true))

(assert (=> start!25680 (array_inv!2533 arr!237)))

(declare-fun inv!12 (BitStream!4752) Bool)

(assert (=> start!25680 (and (inv!12 thiss!1634) e!86870)))

(declare-fun b!131058 () Bool)

(declare-fun res!108690 () Bool)

(assert (=> b!131058 (=> (not res!108690) (not e!86865))))

(assert (=> b!131058 (= res!108690 (= (bitIndex!0 (size!2744 (buf!3105 (_2!5958 lt!202106))) (currentByte!5878 (_2!5958 lt!202106)) (currentBit!5873 (_2!5958 lt!202106))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2744 (buf!3105 thiss!1634)) (currentByte!5878 thiss!1634) (currentBit!5873 thiss!1634)))))))

(declare-fun b!131059 () Bool)

(assert (=> b!131059 (= e!86867 (invariant!0 (currentBit!5873 thiss!1634) (currentByte!5878 thiss!1634) (size!2744 (buf!3105 (_2!5958 lt!202106)))))))

(declare-fun b!131060 () Bool)

(assert (=> b!131060 (= e!86866 (= (_2!5960 lt!202110) (_2!5960 lt!202105)))))

(assert (= (and start!25680 res!108686) b!131055))

(assert (= (and b!131055 res!108691) b!131056))

(assert (= (and b!131056 res!108689) b!131047))

(assert (= (and b!131047 res!108684) b!131057))

(assert (= (and b!131057 res!108685) b!131058))

(assert (= (and b!131058 res!108690) b!131051))

(assert (= (and b!131051 res!108694) b!131050))

(assert (= (and b!131057 res!108687) b!131049))

(assert (= (and b!131049 res!108688) b!131048))

(assert (= (and b!131048 res!108693) b!131052))

(assert (= (and b!131052 (not res!108682)) b!131053))

(assert (= (and b!131057 res!108683) b!131059))

(assert (= (and b!131057 res!108692) b!131060))

(assert (= start!25680 b!131054))

(declare-fun m!197687 () Bool)

(assert (=> start!25680 m!197687))

(declare-fun m!197689 () Bool)

(assert (=> start!25680 m!197689))

(declare-fun m!197691 () Bool)

(assert (=> b!131052 m!197691))

(declare-fun m!197693 () Bool)

(assert (=> b!131052 m!197693))

(declare-fun m!197695 () Bool)

(assert (=> b!131052 m!197695))

(declare-fun m!197697 () Bool)

(assert (=> b!131052 m!197697))

(declare-fun m!197699 () Bool)

(assert (=> b!131053 m!197699))

(declare-fun m!197701 () Bool)

(assert (=> b!131048 m!197701))

(declare-fun m!197703 () Bool)

(assert (=> b!131059 m!197703))

(declare-fun m!197705 () Bool)

(assert (=> b!131058 m!197705))

(declare-fun m!197707 () Bool)

(assert (=> b!131058 m!197707))

(declare-fun m!197709 () Bool)

(assert (=> b!131047 m!197709))

(declare-fun m!197711 () Bool)

(assert (=> b!131050 m!197711))

(declare-fun m!197713 () Bool)

(assert (=> b!131050 m!197713))

(declare-fun m!197715 () Bool)

(assert (=> b!131050 m!197715))

(declare-fun m!197717 () Bool)

(assert (=> b!131054 m!197717))

(declare-fun m!197719 () Bool)

(assert (=> b!131057 m!197719))

(declare-fun m!197721 () Bool)

(assert (=> b!131057 m!197721))

(declare-fun m!197723 () Bool)

(assert (=> b!131057 m!197723))

(declare-fun m!197725 () Bool)

(assert (=> b!131057 m!197725))

(declare-fun m!197727 () Bool)

(assert (=> b!131057 m!197727))

(declare-fun m!197729 () Bool)

(assert (=> b!131057 m!197729))

(declare-fun m!197731 () Bool)

(assert (=> b!131057 m!197731))

(declare-fun m!197733 () Bool)

(assert (=> b!131057 m!197733))

(assert (=> b!131057 m!197711))

(declare-fun m!197735 () Bool)

(assert (=> b!131057 m!197735))

(declare-fun m!197737 () Bool)

(assert (=> b!131057 m!197737))

(assert (=> b!131057 m!197697))

(declare-fun m!197739 () Bool)

(assert (=> b!131057 m!197739))

(declare-fun m!197741 () Bool)

(assert (=> b!131057 m!197741))

(declare-fun m!197743 () Bool)

(assert (=> b!131057 m!197743))

(declare-fun m!197745 () Bool)

(assert (=> b!131057 m!197745))

(declare-fun m!197747 () Bool)

(assert (=> b!131057 m!197747))

(declare-fun m!197749 () Bool)

(assert (=> b!131057 m!197749))

(assert (=> b!131057 m!197711))

(declare-fun m!197751 () Bool)

(assert (=> b!131051 m!197751))

(declare-fun m!197753 () Bool)

(assert (=> b!131055 m!197753))

(declare-fun m!197755 () Bool)

(assert (=> b!131049 m!197755))

(assert (=> b!131049 m!197705))

(check-sat (not b!131050) (not b!131049) (not b!131051) (not b!131053) (not b!131055) (not b!131048) (not b!131052) (not start!25680) (not b!131047) (not b!131058) (not b!131059) (not b!131054) (not b!131057))
(check-sat)
(get-model)

(declare-fun d!41855 () Bool)

(declare-fun res!108898 () Bool)

(declare-fun e!87010 () Bool)

(assert (=> d!41855 (=> res!108898 e!87010)))

(assert (=> d!41855 (= res!108898 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!41855 (= (arrayRangesEq!147 arr!237 (_2!5961 lt!202115) #b00000000000000000000000000000000 to!404) e!87010)))

(declare-fun b!131287 () Bool)

(declare-fun e!87011 () Bool)

(assert (=> b!131287 (= e!87010 e!87011)))

(declare-fun res!108899 () Bool)

(assert (=> b!131287 (=> (not res!108899) (not e!87011))))

(assert (=> b!131287 (= res!108899 (= (select (arr!3367 arr!237) #b00000000000000000000000000000000) (select (arr!3367 (_2!5961 lt!202115)) #b00000000000000000000000000000000)))))

(declare-fun b!131288 () Bool)

(assert (=> b!131288 (= e!87011 (arrayRangesEq!147 arr!237 (_2!5961 lt!202115) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!41855 (not res!108898)) b!131287))

(assert (= (and b!131287 res!108899) b!131288))

(declare-fun m!198171 () Bool)

(assert (=> b!131287 m!198171))

(declare-fun m!198173 () Bool)

(assert (=> b!131287 m!198173))

(declare-fun m!198175 () Bool)

(assert (=> b!131288 m!198175))

(assert (=> b!131053 d!41855))

(declare-fun d!41857 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!41857 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2744 (buf!3105 thiss!1634))) ((_ sign_extend 32) (currentByte!5878 thiss!1634)) ((_ sign_extend 32) (currentBit!5873 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2744 (buf!3105 thiss!1634))) ((_ sign_extend 32) (currentByte!5878 thiss!1634)) ((_ sign_extend 32) (currentBit!5873 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10216 () Bool)

(assert (= bs!10216 d!41857))

(declare-fun m!198177 () Bool)

(assert (=> bs!10216 m!198177))

(assert (=> b!131055 d!41857))

(declare-fun d!41859 () Bool)

(assert (=> d!41859 (= (array_inv!2533 (buf!3105 thiss!1634)) (bvsge (size!2744 (buf!3105 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!131054 d!41859))

(declare-fun d!41861 () Bool)

(declare-fun res!108908 () Bool)

(declare-fun e!87017 () Bool)

(assert (=> d!41861 (=> (not res!108908) (not e!87017))))

(assert (=> d!41861 (= res!108908 (= (size!2744 (buf!3105 thiss!1634)) (size!2744 (buf!3105 (_2!5958 lt!202106)))))))

(assert (=> d!41861 (= (isPrefixOf!0 thiss!1634 (_2!5958 lt!202106)) e!87017)))

(declare-fun b!131295 () Bool)

(declare-fun res!108907 () Bool)

(assert (=> b!131295 (=> (not res!108907) (not e!87017))))

(assert (=> b!131295 (= res!108907 (bvsle (bitIndex!0 (size!2744 (buf!3105 thiss!1634)) (currentByte!5878 thiss!1634) (currentBit!5873 thiss!1634)) (bitIndex!0 (size!2744 (buf!3105 (_2!5958 lt!202106))) (currentByte!5878 (_2!5958 lt!202106)) (currentBit!5873 (_2!5958 lt!202106)))))))

(declare-fun b!131296 () Bool)

(declare-fun e!87016 () Bool)

(assert (=> b!131296 (= e!87017 e!87016)))

(declare-fun res!108906 () Bool)

(assert (=> b!131296 (=> res!108906 e!87016)))

(assert (=> b!131296 (= res!108906 (= (size!2744 (buf!3105 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!131297 () Bool)

(declare-fun arrayBitRangesEq!0 (array!6060 array!6060 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!131297 (= e!87016 (arrayBitRangesEq!0 (buf!3105 thiss!1634) (buf!3105 (_2!5958 lt!202106)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2744 (buf!3105 thiss!1634)) (currentByte!5878 thiss!1634) (currentBit!5873 thiss!1634))))))

(assert (= (and d!41861 res!108908) b!131295))

(assert (= (and b!131295 res!108907) b!131296))

(assert (= (and b!131296 (not res!108906)) b!131297))

(assert (=> b!131295 m!197707))

(assert (=> b!131295 m!197705))

(assert (=> b!131297 m!197707))

(assert (=> b!131297 m!197707))

(declare-fun m!198179 () Bool)

(assert (=> b!131297 m!198179))

(assert (=> b!131051 d!41861))

(declare-fun d!41863 () Bool)

(declare-datatypes ((tuple2!11336 0))(
  ( (tuple2!11337 (_1!5970 (_ BitVec 8)) (_2!5970 BitStream!4752)) )
))
(declare-fun lt!202615 () tuple2!11336)

(declare-fun readByte!0 (BitStream!4752) tuple2!11336)

(assert (=> d!41863 (= lt!202615 (readByte!0 (_1!5959 lt!202101)))))

(assert (=> d!41863 (= (readBytePure!0 (_1!5959 lt!202101)) (tuple2!11321 (_2!5970 lt!202615) (_1!5970 lt!202615)))))

(declare-fun bs!10217 () Bool)

(assert (= bs!10217 d!41863))

(declare-fun m!198181 () Bool)

(assert (=> bs!10217 m!198181))

(assert (=> b!131050 d!41863))

(declare-fun b!131308 () Bool)

(declare-fun e!87022 () Unit!8102)

(declare-fun lt!202660 () Unit!8102)

(assert (=> b!131308 (= e!87022 lt!202660)))

(declare-fun lt!202670 () (_ BitVec 64))

(assert (=> b!131308 (= lt!202670 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!202656 () (_ BitVec 64))

(assert (=> b!131308 (= lt!202656 (bitIndex!0 (size!2744 (buf!3105 thiss!1634)) (currentByte!5878 thiss!1634) (currentBit!5873 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6060 array!6060 (_ BitVec 64) (_ BitVec 64)) Unit!8102)

(assert (=> b!131308 (= lt!202660 (arrayBitRangesEqSymmetric!0 (buf!3105 thiss!1634) (buf!3105 (_2!5958 lt!202106)) lt!202670 lt!202656))))

(assert (=> b!131308 (arrayBitRangesEq!0 (buf!3105 (_2!5958 lt!202106)) (buf!3105 thiss!1634) lt!202670 lt!202656)))

(declare-fun d!41865 () Bool)

(declare-fun e!87023 () Bool)

(assert (=> d!41865 e!87023))

(declare-fun res!108915 () Bool)

(assert (=> d!41865 (=> (not res!108915) (not e!87023))))

(declare-fun lt!202665 () tuple2!11318)

(assert (=> d!41865 (= res!108915 (isPrefixOf!0 (_1!5959 lt!202665) (_2!5959 lt!202665)))))

(declare-fun lt!202675 () BitStream!4752)

(assert (=> d!41865 (= lt!202665 (tuple2!11319 lt!202675 (_2!5958 lt!202106)))))

(declare-fun lt!202673 () Unit!8102)

(declare-fun lt!202667 () Unit!8102)

(assert (=> d!41865 (= lt!202673 lt!202667)))

(assert (=> d!41865 (isPrefixOf!0 lt!202675 (_2!5958 lt!202106))))

(assert (=> d!41865 (= lt!202667 (lemmaIsPrefixTransitive!0 lt!202675 (_2!5958 lt!202106) (_2!5958 lt!202106)))))

(declare-fun lt!202671 () Unit!8102)

(declare-fun lt!202663 () Unit!8102)

(assert (=> d!41865 (= lt!202671 lt!202663)))

(assert (=> d!41865 (isPrefixOf!0 lt!202675 (_2!5958 lt!202106))))

(assert (=> d!41865 (= lt!202663 (lemmaIsPrefixTransitive!0 lt!202675 thiss!1634 (_2!5958 lt!202106)))))

(declare-fun lt!202674 () Unit!8102)

(assert (=> d!41865 (= lt!202674 e!87022)))

(declare-fun c!7567 () Bool)

(assert (=> d!41865 (= c!7567 (not (= (size!2744 (buf!3105 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!202664 () Unit!8102)

(declare-fun lt!202668 () Unit!8102)

(assert (=> d!41865 (= lt!202664 lt!202668)))

(assert (=> d!41865 (isPrefixOf!0 (_2!5958 lt!202106) (_2!5958 lt!202106))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4752) Unit!8102)

(assert (=> d!41865 (= lt!202668 (lemmaIsPrefixRefl!0 (_2!5958 lt!202106)))))

(declare-fun lt!202661 () Unit!8102)

(declare-fun lt!202658 () Unit!8102)

(assert (=> d!41865 (= lt!202661 lt!202658)))

(assert (=> d!41865 (= lt!202658 (lemmaIsPrefixRefl!0 (_2!5958 lt!202106)))))

(declare-fun lt!202662 () Unit!8102)

(declare-fun lt!202672 () Unit!8102)

(assert (=> d!41865 (= lt!202662 lt!202672)))

(assert (=> d!41865 (isPrefixOf!0 lt!202675 lt!202675)))

(assert (=> d!41865 (= lt!202672 (lemmaIsPrefixRefl!0 lt!202675))))

(declare-fun lt!202669 () Unit!8102)

(declare-fun lt!202657 () Unit!8102)

(assert (=> d!41865 (= lt!202669 lt!202657)))

(assert (=> d!41865 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!41865 (= lt!202657 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!41865 (= lt!202675 (BitStream!4753 (buf!3105 (_2!5958 lt!202106)) (currentByte!5878 thiss!1634) (currentBit!5873 thiss!1634)))))

(assert (=> d!41865 (isPrefixOf!0 thiss!1634 (_2!5958 lt!202106))))

(assert (=> d!41865 (= (reader!0 thiss!1634 (_2!5958 lt!202106)) lt!202665)))

(declare-fun b!131309 () Bool)

(declare-fun Unit!8112 () Unit!8102)

(assert (=> b!131309 (= e!87022 Unit!8112)))

(declare-fun b!131310 () Bool)

(declare-fun res!108916 () Bool)

(assert (=> b!131310 (=> (not res!108916) (not e!87023))))

(assert (=> b!131310 (= res!108916 (isPrefixOf!0 (_2!5959 lt!202665) (_2!5958 lt!202106)))))

(declare-fun b!131311 () Bool)

(declare-fun res!108917 () Bool)

(assert (=> b!131311 (=> (not res!108917) (not e!87023))))

(assert (=> b!131311 (= res!108917 (isPrefixOf!0 (_1!5959 lt!202665) thiss!1634))))

(declare-fun lt!202666 () (_ BitVec 64))

(declare-fun b!131312 () Bool)

(declare-fun lt!202659 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4752 (_ BitVec 64)) BitStream!4752)

(assert (=> b!131312 (= e!87023 (= (_1!5959 lt!202665) (withMovedBitIndex!0 (_2!5959 lt!202665) (bvsub lt!202659 lt!202666))))))

(assert (=> b!131312 (or (= (bvand lt!202659 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!202666 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!202659 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!202659 lt!202666) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!131312 (= lt!202666 (bitIndex!0 (size!2744 (buf!3105 (_2!5958 lt!202106))) (currentByte!5878 (_2!5958 lt!202106)) (currentBit!5873 (_2!5958 lt!202106))))))

(assert (=> b!131312 (= lt!202659 (bitIndex!0 (size!2744 (buf!3105 thiss!1634)) (currentByte!5878 thiss!1634) (currentBit!5873 thiss!1634)))))

(assert (= (and d!41865 c!7567) b!131308))

(assert (= (and d!41865 (not c!7567)) b!131309))

(assert (= (and d!41865 res!108915) b!131311))

(assert (= (and b!131311 res!108917) b!131310))

(assert (= (and b!131310 res!108916) b!131312))

(assert (=> b!131308 m!197707))

(declare-fun m!198183 () Bool)

(assert (=> b!131308 m!198183))

(declare-fun m!198185 () Bool)

(assert (=> b!131308 m!198185))

(declare-fun m!198187 () Bool)

(assert (=> b!131311 m!198187))

(declare-fun m!198189 () Bool)

(assert (=> b!131312 m!198189))

(assert (=> b!131312 m!197705))

(assert (=> b!131312 m!197707))

(assert (=> d!41865 m!197751))

(declare-fun m!198191 () Bool)

(assert (=> d!41865 m!198191))

(declare-fun m!198193 () Bool)

(assert (=> d!41865 m!198193))

(declare-fun m!198195 () Bool)

(assert (=> d!41865 m!198195))

(declare-fun m!198197 () Bool)

(assert (=> d!41865 m!198197))

(declare-fun m!198199 () Bool)

(assert (=> d!41865 m!198199))

(declare-fun m!198201 () Bool)

(assert (=> d!41865 m!198201))

(declare-fun m!198203 () Bool)

(assert (=> d!41865 m!198203))

(declare-fun m!198205 () Bool)

(assert (=> d!41865 m!198205))

(declare-fun m!198207 () Bool)

(assert (=> d!41865 m!198207))

(declare-fun m!198209 () Bool)

(assert (=> d!41865 m!198209))

(declare-fun m!198211 () Bool)

(assert (=> b!131310 m!198211))

(assert (=> b!131050 d!41865))

(declare-fun d!41867 () Bool)

(declare-datatypes ((tuple3!494 0))(
  ( (tuple3!495 (_1!5971 Unit!8102) (_2!5971 BitStream!4752) (_3!302 array!6060)) )
))
(declare-fun lt!202678 () tuple3!494)

(declare-fun readByteArrayLoop!0 (BitStream!4752 array!6060 (_ BitVec 32) (_ BitVec 32)) tuple3!494)

(assert (=> d!41867 (= lt!202678 (readByteArrayLoop!0 (_1!5959 lt!202103) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!41867 (= (readByteArrayLoopPure!0 (_1!5959 lt!202103) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11323 (_2!5971 lt!202678) (_3!302 lt!202678)))))

(declare-fun bs!10218 () Bool)

(assert (= bs!10218 d!41867))

(declare-fun m!198213 () Bool)

(assert (=> bs!10218 m!198213))

(assert (=> b!131052 d!41867))

(declare-fun d!41869 () Bool)

(assert (=> d!41869 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2744 (buf!3105 (_2!5958 lt!202113)))) ((_ sign_extend 32) (currentByte!5878 (_2!5958 lt!202106))) ((_ sign_extend 32) (currentBit!5873 (_2!5958 lt!202106))) lt!202109) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2744 (buf!3105 (_2!5958 lt!202113)))) ((_ sign_extend 32) (currentByte!5878 (_2!5958 lt!202106))) ((_ sign_extend 32) (currentBit!5873 (_2!5958 lt!202106)))) lt!202109))))

(declare-fun bs!10219 () Bool)

(assert (= bs!10219 d!41869))

(declare-fun m!198215 () Bool)

(assert (=> bs!10219 m!198215))

(assert (=> b!131052 d!41869))

(declare-fun d!41871 () Bool)

(assert (=> d!41871 (validate_offset_bits!1 ((_ sign_extend 32) (size!2744 (buf!3105 (_2!5958 lt!202113)))) ((_ sign_extend 32) (currentByte!5878 (_2!5958 lt!202106))) ((_ sign_extend 32) (currentBit!5873 (_2!5958 lt!202106))) lt!202109)))

(declare-fun lt!202681 () Unit!8102)

(declare-fun choose!9 (BitStream!4752 array!6060 (_ BitVec 64) BitStream!4752) Unit!8102)

(assert (=> d!41871 (= lt!202681 (choose!9 (_2!5958 lt!202106) (buf!3105 (_2!5958 lt!202113)) lt!202109 (BitStream!4753 (buf!3105 (_2!5958 lt!202113)) (currentByte!5878 (_2!5958 lt!202106)) (currentBit!5873 (_2!5958 lt!202106)))))))

(assert (=> d!41871 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5958 lt!202106) (buf!3105 (_2!5958 lt!202113)) lt!202109) lt!202681)))

(declare-fun bs!10220 () Bool)

(assert (= bs!10220 d!41871))

(assert (=> bs!10220 m!197693))

(declare-fun m!198217 () Bool)

(assert (=> bs!10220 m!198217))

(assert (=> b!131052 d!41871))

(declare-fun b!131313 () Bool)

(declare-fun e!87024 () Unit!8102)

(declare-fun lt!202686 () Unit!8102)

(assert (=> b!131313 (= e!87024 lt!202686)))

(declare-fun lt!202696 () (_ BitVec 64))

(assert (=> b!131313 (= lt!202696 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!202682 () (_ BitVec 64))

(assert (=> b!131313 (= lt!202682 (bitIndex!0 (size!2744 (buf!3105 (_2!5958 lt!202106))) (currentByte!5878 (_2!5958 lt!202106)) (currentBit!5873 (_2!5958 lt!202106))))))

(assert (=> b!131313 (= lt!202686 (arrayBitRangesEqSymmetric!0 (buf!3105 (_2!5958 lt!202106)) (buf!3105 (_2!5958 lt!202113)) lt!202696 lt!202682))))

(assert (=> b!131313 (arrayBitRangesEq!0 (buf!3105 (_2!5958 lt!202113)) (buf!3105 (_2!5958 lt!202106)) lt!202696 lt!202682)))

(declare-fun d!41873 () Bool)

(declare-fun e!87025 () Bool)

(assert (=> d!41873 e!87025))

(declare-fun res!108918 () Bool)

(assert (=> d!41873 (=> (not res!108918) (not e!87025))))

(declare-fun lt!202691 () tuple2!11318)

(assert (=> d!41873 (= res!108918 (isPrefixOf!0 (_1!5959 lt!202691) (_2!5959 lt!202691)))))

(declare-fun lt!202701 () BitStream!4752)

(assert (=> d!41873 (= lt!202691 (tuple2!11319 lt!202701 (_2!5958 lt!202113)))))

(declare-fun lt!202699 () Unit!8102)

(declare-fun lt!202693 () Unit!8102)

(assert (=> d!41873 (= lt!202699 lt!202693)))

(assert (=> d!41873 (isPrefixOf!0 lt!202701 (_2!5958 lt!202113))))

(assert (=> d!41873 (= lt!202693 (lemmaIsPrefixTransitive!0 lt!202701 (_2!5958 lt!202113) (_2!5958 lt!202113)))))

(declare-fun lt!202697 () Unit!8102)

(declare-fun lt!202689 () Unit!8102)

(assert (=> d!41873 (= lt!202697 lt!202689)))

(assert (=> d!41873 (isPrefixOf!0 lt!202701 (_2!5958 lt!202113))))

(assert (=> d!41873 (= lt!202689 (lemmaIsPrefixTransitive!0 lt!202701 (_2!5958 lt!202106) (_2!5958 lt!202113)))))

(declare-fun lt!202700 () Unit!8102)

(assert (=> d!41873 (= lt!202700 e!87024)))

(declare-fun c!7568 () Bool)

(assert (=> d!41873 (= c!7568 (not (= (size!2744 (buf!3105 (_2!5958 lt!202106))) #b00000000000000000000000000000000)))))

(declare-fun lt!202690 () Unit!8102)

(declare-fun lt!202694 () Unit!8102)

(assert (=> d!41873 (= lt!202690 lt!202694)))

(assert (=> d!41873 (isPrefixOf!0 (_2!5958 lt!202113) (_2!5958 lt!202113))))

(assert (=> d!41873 (= lt!202694 (lemmaIsPrefixRefl!0 (_2!5958 lt!202113)))))

(declare-fun lt!202687 () Unit!8102)

(declare-fun lt!202684 () Unit!8102)

(assert (=> d!41873 (= lt!202687 lt!202684)))

(assert (=> d!41873 (= lt!202684 (lemmaIsPrefixRefl!0 (_2!5958 lt!202113)))))

(declare-fun lt!202688 () Unit!8102)

(declare-fun lt!202698 () Unit!8102)

(assert (=> d!41873 (= lt!202688 lt!202698)))

(assert (=> d!41873 (isPrefixOf!0 lt!202701 lt!202701)))

(assert (=> d!41873 (= lt!202698 (lemmaIsPrefixRefl!0 lt!202701))))

(declare-fun lt!202695 () Unit!8102)

(declare-fun lt!202683 () Unit!8102)

(assert (=> d!41873 (= lt!202695 lt!202683)))

(assert (=> d!41873 (isPrefixOf!0 (_2!5958 lt!202106) (_2!5958 lt!202106))))

(assert (=> d!41873 (= lt!202683 (lemmaIsPrefixRefl!0 (_2!5958 lt!202106)))))

(assert (=> d!41873 (= lt!202701 (BitStream!4753 (buf!3105 (_2!5958 lt!202113)) (currentByte!5878 (_2!5958 lt!202106)) (currentBit!5873 (_2!5958 lt!202106))))))

(assert (=> d!41873 (isPrefixOf!0 (_2!5958 lt!202106) (_2!5958 lt!202113))))

(assert (=> d!41873 (= (reader!0 (_2!5958 lt!202106) (_2!5958 lt!202113)) lt!202691)))

(declare-fun b!131314 () Bool)

(declare-fun Unit!8113 () Unit!8102)

(assert (=> b!131314 (= e!87024 Unit!8113)))

(declare-fun b!131315 () Bool)

(declare-fun res!108919 () Bool)

(assert (=> b!131315 (=> (not res!108919) (not e!87025))))

(assert (=> b!131315 (= res!108919 (isPrefixOf!0 (_2!5959 lt!202691) (_2!5958 lt!202113)))))

(declare-fun b!131316 () Bool)

(declare-fun res!108920 () Bool)

(assert (=> b!131316 (=> (not res!108920) (not e!87025))))

(assert (=> b!131316 (= res!108920 (isPrefixOf!0 (_1!5959 lt!202691) (_2!5958 lt!202106)))))

(declare-fun lt!202692 () (_ BitVec 64))

(declare-fun lt!202685 () (_ BitVec 64))

(declare-fun b!131317 () Bool)

(assert (=> b!131317 (= e!87025 (= (_1!5959 lt!202691) (withMovedBitIndex!0 (_2!5959 lt!202691) (bvsub lt!202685 lt!202692))))))

(assert (=> b!131317 (or (= (bvand lt!202685 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!202692 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!202685 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!202685 lt!202692) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!131317 (= lt!202692 (bitIndex!0 (size!2744 (buf!3105 (_2!5958 lt!202113))) (currentByte!5878 (_2!5958 lt!202113)) (currentBit!5873 (_2!5958 lt!202113))))))

(assert (=> b!131317 (= lt!202685 (bitIndex!0 (size!2744 (buf!3105 (_2!5958 lt!202106))) (currentByte!5878 (_2!5958 lt!202106)) (currentBit!5873 (_2!5958 lt!202106))))))

(assert (= (and d!41873 c!7568) b!131313))

(assert (= (and d!41873 (not c!7568)) b!131314))

(assert (= (and d!41873 res!108918) b!131316))

(assert (= (and b!131316 res!108920) b!131315))

(assert (= (and b!131315 res!108919) b!131317))

(assert (=> b!131313 m!197705))

(declare-fun m!198219 () Bool)

(assert (=> b!131313 m!198219))

(declare-fun m!198221 () Bool)

(assert (=> b!131313 m!198221))

(declare-fun m!198223 () Bool)

(assert (=> b!131316 m!198223))

(declare-fun m!198225 () Bool)

(assert (=> b!131317 m!198225))

(assert (=> b!131317 m!197755))

(assert (=> b!131317 m!197705))

(assert (=> d!41873 m!197701))

(assert (=> d!41873 m!198193))

(declare-fun m!198227 () Bool)

(assert (=> d!41873 m!198227))

(declare-fun m!198229 () Bool)

(assert (=> d!41873 m!198229))

(assert (=> d!41873 m!198195))

(declare-fun m!198231 () Bool)

(assert (=> d!41873 m!198231))

(declare-fun m!198233 () Bool)

(assert (=> d!41873 m!198233))

(declare-fun m!198235 () Bool)

(assert (=> d!41873 m!198235))

(declare-fun m!198237 () Bool)

(assert (=> d!41873 m!198237))

(declare-fun m!198239 () Bool)

(assert (=> d!41873 m!198239))

(declare-fun m!198241 () Bool)

(assert (=> d!41873 m!198241))

(declare-fun m!198243 () Bool)

(assert (=> b!131315 m!198243))

(assert (=> b!131052 d!41873))

(declare-fun d!41875 () Bool)

(assert (=> d!41875 (= (invariant!0 (currentBit!5873 thiss!1634) (currentByte!5878 thiss!1634) (size!2744 (buf!3105 (_2!5958 lt!202106)))) (and (bvsge (currentBit!5873 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!5873 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!5878 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!5878 thiss!1634) (size!2744 (buf!3105 (_2!5958 lt!202106)))) (and (= (currentBit!5873 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!5878 thiss!1634) (size!2744 (buf!3105 (_2!5958 lt!202106))))))))))

(assert (=> b!131059 d!41875))

(declare-fun d!41877 () Bool)

(declare-fun res!108923 () Bool)

(declare-fun e!87027 () Bool)

(assert (=> d!41877 (=> (not res!108923) (not e!87027))))

(assert (=> d!41877 (= res!108923 (= (size!2744 (buf!3105 (_2!5958 lt!202106))) (size!2744 (buf!3105 (_2!5958 lt!202113)))))))

(assert (=> d!41877 (= (isPrefixOf!0 (_2!5958 lt!202106) (_2!5958 lt!202113)) e!87027)))

(declare-fun b!131318 () Bool)

(declare-fun res!108922 () Bool)

(assert (=> b!131318 (=> (not res!108922) (not e!87027))))

(assert (=> b!131318 (= res!108922 (bvsle (bitIndex!0 (size!2744 (buf!3105 (_2!5958 lt!202106))) (currentByte!5878 (_2!5958 lt!202106)) (currentBit!5873 (_2!5958 lt!202106))) (bitIndex!0 (size!2744 (buf!3105 (_2!5958 lt!202113))) (currentByte!5878 (_2!5958 lt!202113)) (currentBit!5873 (_2!5958 lt!202113)))))))

(declare-fun b!131319 () Bool)

(declare-fun e!87026 () Bool)

(assert (=> b!131319 (= e!87027 e!87026)))

(declare-fun res!108921 () Bool)

(assert (=> b!131319 (=> res!108921 e!87026)))

(assert (=> b!131319 (= res!108921 (= (size!2744 (buf!3105 (_2!5958 lt!202106))) #b00000000000000000000000000000000))))

(declare-fun b!131320 () Bool)

(assert (=> b!131320 (= e!87026 (arrayBitRangesEq!0 (buf!3105 (_2!5958 lt!202106)) (buf!3105 (_2!5958 lt!202113)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2744 (buf!3105 (_2!5958 lt!202106))) (currentByte!5878 (_2!5958 lt!202106)) (currentBit!5873 (_2!5958 lt!202106)))))))

(assert (= (and d!41877 res!108923) b!131318))

(assert (= (and b!131318 res!108922) b!131319))

(assert (= (and b!131319 (not res!108921)) b!131320))

(assert (=> b!131318 m!197705))

(assert (=> b!131318 m!197755))

(assert (=> b!131320 m!197705))

(assert (=> b!131320 m!197705))

(declare-fun m!198245 () Bool)

(assert (=> b!131320 m!198245))

(assert (=> b!131048 d!41877))

(declare-fun d!41879 () Bool)

(declare-fun e!87030 () Bool)

(assert (=> d!41879 e!87030))

(declare-fun res!108929 () Bool)

(assert (=> d!41879 (=> (not res!108929) (not e!87030))))

(declare-fun lt!202715 () (_ BitVec 64))

(declare-fun lt!202716 () (_ BitVec 64))

(declare-fun lt!202714 () (_ BitVec 64))

(assert (=> d!41879 (= res!108929 (= lt!202715 (bvsub lt!202716 lt!202714)))))

(assert (=> d!41879 (or (= (bvand lt!202716 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!202714 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!202716 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!202716 lt!202714) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41879 (= lt!202714 (remainingBits!0 ((_ sign_extend 32) (size!2744 (buf!3105 (_2!5958 lt!202106)))) ((_ sign_extend 32) (currentByte!5878 (_2!5958 lt!202106))) ((_ sign_extend 32) (currentBit!5873 (_2!5958 lt!202106)))))))

(declare-fun lt!202718 () (_ BitVec 64))

(declare-fun lt!202717 () (_ BitVec 64))

(assert (=> d!41879 (= lt!202716 (bvmul lt!202718 lt!202717))))

(assert (=> d!41879 (or (= lt!202718 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!202717 (bvsdiv (bvmul lt!202718 lt!202717) lt!202718)))))

(assert (=> d!41879 (= lt!202717 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41879 (= lt!202718 ((_ sign_extend 32) (size!2744 (buf!3105 (_2!5958 lt!202106)))))))

(assert (=> d!41879 (= lt!202715 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5878 (_2!5958 lt!202106))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5873 (_2!5958 lt!202106)))))))

(assert (=> d!41879 (invariant!0 (currentBit!5873 (_2!5958 lt!202106)) (currentByte!5878 (_2!5958 lt!202106)) (size!2744 (buf!3105 (_2!5958 lt!202106))))))

(assert (=> d!41879 (= (bitIndex!0 (size!2744 (buf!3105 (_2!5958 lt!202106))) (currentByte!5878 (_2!5958 lt!202106)) (currentBit!5873 (_2!5958 lt!202106))) lt!202715)))

(declare-fun b!131325 () Bool)

(declare-fun res!108928 () Bool)

(assert (=> b!131325 (=> (not res!108928) (not e!87030))))

(assert (=> b!131325 (= res!108928 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!202715))))

(declare-fun b!131326 () Bool)

(declare-fun lt!202719 () (_ BitVec 64))

(assert (=> b!131326 (= e!87030 (bvsle lt!202715 (bvmul lt!202719 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!131326 (or (= lt!202719 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!202719 #b0000000000000000000000000000000000000000000000000000000000001000) lt!202719)))))

(assert (=> b!131326 (= lt!202719 ((_ sign_extend 32) (size!2744 (buf!3105 (_2!5958 lt!202106)))))))

(assert (= (and d!41879 res!108929) b!131325))

(assert (= (and b!131325 res!108928) b!131326))

(declare-fun m!198247 () Bool)

(assert (=> d!41879 m!198247))

(declare-fun m!198249 () Bool)

(assert (=> d!41879 m!198249))

(assert (=> b!131058 d!41879))

(declare-fun d!41881 () Bool)

(declare-fun e!87031 () Bool)

(assert (=> d!41881 e!87031))

(declare-fun res!108931 () Bool)

(assert (=> d!41881 (=> (not res!108931) (not e!87031))))

(declare-fun lt!202720 () (_ BitVec 64))

(declare-fun lt!202721 () (_ BitVec 64))

(declare-fun lt!202722 () (_ BitVec 64))

(assert (=> d!41881 (= res!108931 (= lt!202721 (bvsub lt!202722 lt!202720)))))

(assert (=> d!41881 (or (= (bvand lt!202722 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!202720 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!202722 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!202722 lt!202720) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41881 (= lt!202720 (remainingBits!0 ((_ sign_extend 32) (size!2744 (buf!3105 thiss!1634))) ((_ sign_extend 32) (currentByte!5878 thiss!1634)) ((_ sign_extend 32) (currentBit!5873 thiss!1634))))))

(declare-fun lt!202724 () (_ BitVec 64))

(declare-fun lt!202723 () (_ BitVec 64))

(assert (=> d!41881 (= lt!202722 (bvmul lt!202724 lt!202723))))

(assert (=> d!41881 (or (= lt!202724 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!202723 (bvsdiv (bvmul lt!202724 lt!202723) lt!202724)))))

(assert (=> d!41881 (= lt!202723 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41881 (= lt!202724 ((_ sign_extend 32) (size!2744 (buf!3105 thiss!1634))))))

(assert (=> d!41881 (= lt!202721 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5878 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5873 thiss!1634))))))

(assert (=> d!41881 (invariant!0 (currentBit!5873 thiss!1634) (currentByte!5878 thiss!1634) (size!2744 (buf!3105 thiss!1634)))))

(assert (=> d!41881 (= (bitIndex!0 (size!2744 (buf!3105 thiss!1634)) (currentByte!5878 thiss!1634) (currentBit!5873 thiss!1634)) lt!202721)))

(declare-fun b!131327 () Bool)

(declare-fun res!108930 () Bool)

(assert (=> b!131327 (=> (not res!108930) (not e!87031))))

(assert (=> b!131327 (= res!108930 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!202721))))

(declare-fun b!131328 () Bool)

(declare-fun lt!202725 () (_ BitVec 64))

(assert (=> b!131328 (= e!87031 (bvsle lt!202721 (bvmul lt!202725 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!131328 (or (= lt!202725 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!202725 #b0000000000000000000000000000000000000000000000000000000000001000) lt!202725)))))

(assert (=> b!131328 (= lt!202725 ((_ sign_extend 32) (size!2744 (buf!3105 thiss!1634))))))

(assert (= (and d!41881 res!108931) b!131327))

(assert (= (and b!131327 res!108930) b!131328))

(assert (=> d!41881 m!198177))

(assert (=> d!41881 m!197709))

(assert (=> b!131058 d!41881))

(declare-fun d!41883 () Bool)

(declare-fun e!87032 () Bool)

(assert (=> d!41883 e!87032))

(declare-fun res!108933 () Bool)

(assert (=> d!41883 (=> (not res!108933) (not e!87032))))

(declare-fun lt!202728 () (_ BitVec 64))

(declare-fun lt!202726 () (_ BitVec 64))

(declare-fun lt!202727 () (_ BitVec 64))

(assert (=> d!41883 (= res!108933 (= lt!202727 (bvsub lt!202728 lt!202726)))))

(assert (=> d!41883 (or (= (bvand lt!202728 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!202726 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!202728 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!202728 lt!202726) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41883 (= lt!202726 (remainingBits!0 ((_ sign_extend 32) (size!2744 (buf!3105 (_2!5958 lt!202113)))) ((_ sign_extend 32) (currentByte!5878 (_2!5958 lt!202113))) ((_ sign_extend 32) (currentBit!5873 (_2!5958 lt!202113)))))))

(declare-fun lt!202730 () (_ BitVec 64))

(declare-fun lt!202729 () (_ BitVec 64))

(assert (=> d!41883 (= lt!202728 (bvmul lt!202730 lt!202729))))

(assert (=> d!41883 (or (= lt!202730 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!202729 (bvsdiv (bvmul lt!202730 lt!202729) lt!202730)))))

(assert (=> d!41883 (= lt!202729 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41883 (= lt!202730 ((_ sign_extend 32) (size!2744 (buf!3105 (_2!5958 lt!202113)))))))

(assert (=> d!41883 (= lt!202727 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5878 (_2!5958 lt!202113))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5873 (_2!5958 lt!202113)))))))

(assert (=> d!41883 (invariant!0 (currentBit!5873 (_2!5958 lt!202113)) (currentByte!5878 (_2!5958 lt!202113)) (size!2744 (buf!3105 (_2!5958 lt!202113))))))

(assert (=> d!41883 (= (bitIndex!0 (size!2744 (buf!3105 (_2!5958 lt!202113))) (currentByte!5878 (_2!5958 lt!202113)) (currentBit!5873 (_2!5958 lt!202113))) lt!202727)))

(declare-fun b!131329 () Bool)

(declare-fun res!108932 () Bool)

(assert (=> b!131329 (=> (not res!108932) (not e!87032))))

(assert (=> b!131329 (= res!108932 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!202727))))

(declare-fun b!131330 () Bool)

(declare-fun lt!202731 () (_ BitVec 64))

(assert (=> b!131330 (= e!87032 (bvsle lt!202727 (bvmul lt!202731 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!131330 (or (= lt!202731 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!202731 #b0000000000000000000000000000000000000000000000000000000000001000) lt!202731)))))

(assert (=> b!131330 (= lt!202731 ((_ sign_extend 32) (size!2744 (buf!3105 (_2!5958 lt!202113)))))))

(assert (= (and d!41883 res!108933) b!131329))

(assert (= (and b!131329 res!108932) b!131330))

(declare-fun m!198251 () Bool)

(assert (=> d!41883 m!198251))

(declare-fun m!198253 () Bool)

(assert (=> d!41883 m!198253))

(assert (=> b!131049 d!41883))

(assert (=> b!131049 d!41879))

(declare-fun d!41885 () Bool)

(assert (=> d!41885 (= (invariant!0 (currentBit!5873 thiss!1634) (currentByte!5878 thiss!1634) (size!2744 (buf!3105 thiss!1634))) (and (bvsge (currentBit!5873 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!5873 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!5878 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!5878 thiss!1634) (size!2744 (buf!3105 thiss!1634))) (and (= (currentBit!5873 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!5878 thiss!1634) (size!2744 (buf!3105 thiss!1634)))))))))

(assert (=> b!131047 d!41885))

(declare-fun d!41887 () Bool)

(assert (=> d!41887 (isPrefixOf!0 thiss!1634 (_2!5958 lt!202113))))

(declare-fun lt!202734 () Unit!8102)

(declare-fun choose!30 (BitStream!4752 BitStream!4752 BitStream!4752) Unit!8102)

(assert (=> d!41887 (= lt!202734 (choose!30 thiss!1634 (_2!5958 lt!202106) (_2!5958 lt!202113)))))

(assert (=> d!41887 (isPrefixOf!0 thiss!1634 (_2!5958 lt!202106))))

(assert (=> d!41887 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5958 lt!202106) (_2!5958 lt!202113)) lt!202734)))

(declare-fun bs!10221 () Bool)

(assert (= bs!10221 d!41887))

(assert (=> bs!10221 m!197747))

(declare-fun m!198255 () Bool)

(assert (=> bs!10221 m!198255))

(assert (=> bs!10221 m!197751))

(assert (=> b!131057 d!41887))

(declare-fun d!41889 () Bool)

(declare-fun lt!202735 () tuple2!11336)

(assert (=> d!41889 (= lt!202735 (readByte!0 (BitStream!4753 (buf!3105 (_2!5958 lt!202113)) (currentByte!5878 thiss!1634) (currentBit!5873 thiss!1634))))))

(assert (=> d!41889 (= (readBytePure!0 (BitStream!4753 (buf!3105 (_2!5958 lt!202113)) (currentByte!5878 thiss!1634) (currentBit!5873 thiss!1634))) (tuple2!11321 (_2!5970 lt!202735) (_1!5970 lt!202735)))))

(declare-fun bs!10222 () Bool)

(assert (= bs!10222 d!41889))

(declare-fun m!198257 () Bool)

(assert (=> bs!10222 m!198257))

(assert (=> b!131057 d!41889))

(declare-fun d!41891 () Bool)

(declare-fun lt!202736 () tuple2!11336)

(assert (=> d!41891 (= lt!202736 (readByte!0 (_1!5959 lt!202111)))))

(assert (=> d!41891 (= (readBytePure!0 (_1!5959 lt!202111)) (tuple2!11321 (_2!5970 lt!202736) (_1!5970 lt!202736)))))

(declare-fun bs!10223 () Bool)

(assert (= bs!10223 d!41891))

(declare-fun m!198259 () Bool)

(assert (=> bs!10223 m!198259))

(assert (=> b!131057 d!41891))

(assert (=> b!131057 d!41873))

(declare-fun d!41893 () Bool)

(declare-fun e!87033 () Bool)

(assert (=> d!41893 e!87033))

(declare-fun res!108935 () Bool)

(assert (=> d!41893 (=> (not res!108935) (not e!87033))))

(declare-fun lt!202739 () (_ BitVec 64))

(declare-fun lt!202737 () (_ BitVec 64))

(declare-fun lt!202738 () (_ BitVec 64))

(assert (=> d!41893 (= res!108935 (= lt!202738 (bvsub lt!202739 lt!202737)))))

(assert (=> d!41893 (or (= (bvand lt!202739 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!202737 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!202739 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!202739 lt!202737) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41893 (= lt!202737 (remainingBits!0 ((_ sign_extend 32) (size!2744 (buf!3105 (_1!5960 lt!202105)))) ((_ sign_extend 32) (currentByte!5878 (_1!5960 lt!202105))) ((_ sign_extend 32) (currentBit!5873 (_1!5960 lt!202105)))))))

(declare-fun lt!202741 () (_ BitVec 64))

(declare-fun lt!202740 () (_ BitVec 64))

(assert (=> d!41893 (= lt!202739 (bvmul lt!202741 lt!202740))))

(assert (=> d!41893 (or (= lt!202741 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!202740 (bvsdiv (bvmul lt!202741 lt!202740) lt!202741)))))

(assert (=> d!41893 (= lt!202740 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41893 (= lt!202741 ((_ sign_extend 32) (size!2744 (buf!3105 (_1!5960 lt!202105)))))))

(assert (=> d!41893 (= lt!202738 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5878 (_1!5960 lt!202105))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5873 (_1!5960 lt!202105)))))))

(assert (=> d!41893 (invariant!0 (currentBit!5873 (_1!5960 lt!202105)) (currentByte!5878 (_1!5960 lt!202105)) (size!2744 (buf!3105 (_1!5960 lt!202105))))))

(assert (=> d!41893 (= (bitIndex!0 (size!2744 (buf!3105 (_1!5960 lt!202105))) (currentByte!5878 (_1!5960 lt!202105)) (currentBit!5873 (_1!5960 lt!202105))) lt!202738)))

(declare-fun b!131331 () Bool)

(declare-fun res!108934 () Bool)

(assert (=> b!131331 (=> (not res!108934) (not e!87033))))

(assert (=> b!131331 (= res!108934 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!202738))))

(declare-fun b!131332 () Bool)

(declare-fun lt!202742 () (_ BitVec 64))

(assert (=> b!131332 (= e!87033 (bvsle lt!202738 (bvmul lt!202742 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!131332 (or (= lt!202742 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!202742 #b0000000000000000000000000000000000000000000000000000000000001000) lt!202742)))))

(assert (=> b!131332 (= lt!202742 ((_ sign_extend 32) (size!2744 (buf!3105 (_1!5960 lt!202105)))))))

(assert (= (and d!41893 res!108935) b!131331))

(assert (= (and b!131331 res!108934) b!131332))

(declare-fun m!198261 () Bool)

(assert (=> d!41893 m!198261))

(declare-fun m!198263 () Bool)

(assert (=> d!41893 m!198263))

(assert (=> b!131057 d!41893))

(declare-fun b!131343 () Bool)

(declare-fun e!87041 () Bool)

(declare-fun e!87040 () Bool)

(assert (=> b!131343 (= e!87041 e!87040)))

(declare-fun res!108948 () Bool)

(assert (=> b!131343 (=> (not res!108948) (not e!87040))))

(declare-fun lt!202767 () tuple2!11322)

(declare-fun lt!202768 () tuple2!11318)

(assert (=> b!131343 (= res!108948 (and (= (size!2744 (_2!5961 lt!202767)) (size!2744 arr!237)) (= (_1!5961 lt!202767) (_2!5959 lt!202768))))))

(assert (=> b!131343 (= lt!202767 (readByteArrayLoopPure!0 (_1!5959 lt!202768) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!202765 () Unit!8102)

(declare-fun lt!202764 () Unit!8102)

(assert (=> b!131343 (= lt!202765 lt!202764)))

(declare-fun lt!202766 () tuple2!11316)

(declare-fun lt!202761 () (_ BitVec 64))

(assert (=> b!131343 (validate_offset_bits!1 ((_ sign_extend 32) (size!2744 (buf!3105 (_2!5958 lt!202766)))) ((_ sign_extend 32) (currentByte!5878 (_2!5958 lt!202106))) ((_ sign_extend 32) (currentBit!5873 (_2!5958 lt!202106))) lt!202761)))

(assert (=> b!131343 (= lt!202764 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5958 lt!202106) (buf!3105 (_2!5958 lt!202766)) lt!202761))))

(declare-fun e!87042 () Bool)

(assert (=> b!131343 e!87042))

(declare-fun res!108949 () Bool)

(assert (=> b!131343 (=> (not res!108949) (not e!87042))))

(assert (=> b!131343 (= res!108949 (and (= (size!2744 (buf!3105 (_2!5958 lt!202106))) (size!2744 (buf!3105 (_2!5958 lt!202766)))) (bvsge lt!202761 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!131343 (= lt!202761 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!131343 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!131343 (= lt!202768 (reader!0 (_2!5958 lt!202106) (_2!5958 lt!202766)))))

(declare-fun b!131344 () Bool)

(assert (=> b!131344 (= e!87040 (arrayRangesEq!147 arr!237 (_2!5961 lt!202767) #b00000000000000000000000000000000 to!404))))

(declare-fun b!131345 () Bool)

(declare-fun res!108950 () Bool)

(assert (=> b!131345 (=> (not res!108950) (not e!87041))))

(assert (=> b!131345 (= res!108950 (isPrefixOf!0 (_2!5958 lt!202106) (_2!5958 lt!202766)))))

(declare-fun d!41895 () Bool)

(assert (=> d!41895 e!87041))

(declare-fun res!108947 () Bool)

(assert (=> d!41895 (=> (not res!108947) (not e!87041))))

(assert (=> d!41895 (= res!108947 (= (size!2744 (buf!3105 (_2!5958 lt!202106))) (size!2744 (buf!3105 (_2!5958 lt!202766)))))))

(declare-fun choose!64 (BitStream!4752 array!6060 (_ BitVec 32) (_ BitVec 32)) tuple2!11316)

(assert (=> d!41895 (= lt!202766 (choose!64 (_2!5958 lt!202106) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!41895 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2744 arr!237)))))

(assert (=> d!41895 (= (appendByteArrayLoop!0 (_2!5958 lt!202106) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!202766)))

(declare-fun b!131346 () Bool)

(assert (=> b!131346 (= e!87042 (validate_offset_bits!1 ((_ sign_extend 32) (size!2744 (buf!3105 (_2!5958 lt!202106)))) ((_ sign_extend 32) (currentByte!5878 (_2!5958 lt!202106))) ((_ sign_extend 32) (currentBit!5873 (_2!5958 lt!202106))) lt!202761))))

(declare-fun b!131347 () Bool)

(declare-fun res!108946 () Bool)

(assert (=> b!131347 (=> (not res!108946) (not e!87041))))

(declare-fun lt!202762 () (_ BitVec 64))

(declare-fun lt!202763 () (_ BitVec 64))

(assert (=> b!131347 (= res!108946 (= (bitIndex!0 (size!2744 (buf!3105 (_2!5958 lt!202766))) (currentByte!5878 (_2!5958 lt!202766)) (currentBit!5873 (_2!5958 lt!202766))) (bvadd lt!202763 lt!202762)))))

(assert (=> b!131347 (or (not (= (bvand lt!202763 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!202762 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!202763 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!202763 lt!202762) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!202769 () (_ BitVec 64))

(assert (=> b!131347 (= lt!202762 (bvmul lt!202769 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!131347 (or (= lt!202769 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!202769 #b0000000000000000000000000000000000000000000000000000000000001000) lt!202769)))))

(assert (=> b!131347 (= lt!202769 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!131347 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!131347 (= lt!202763 (bitIndex!0 (size!2744 (buf!3105 (_2!5958 lt!202106))) (currentByte!5878 (_2!5958 lt!202106)) (currentBit!5873 (_2!5958 lt!202106))))))

(assert (= (and d!41895 res!108947) b!131347))

(assert (= (and b!131347 res!108946) b!131345))

(assert (= (and b!131345 res!108950) b!131343))

(assert (= (and b!131343 res!108949) b!131346))

(assert (= (and b!131343 res!108948) b!131344))

(declare-fun m!198265 () Bool)

(assert (=> b!131344 m!198265))

(declare-fun m!198267 () Bool)

(assert (=> b!131345 m!198267))

(declare-fun m!198269 () Bool)

(assert (=> b!131343 m!198269))

(declare-fun m!198271 () Bool)

(assert (=> b!131343 m!198271))

(declare-fun m!198273 () Bool)

(assert (=> b!131343 m!198273))

(declare-fun m!198275 () Bool)

(assert (=> b!131343 m!198275))

(declare-fun m!198277 () Bool)

(assert (=> b!131347 m!198277))

(assert (=> b!131347 m!197705))

(declare-fun m!198279 () Bool)

(assert (=> b!131346 m!198279))

(declare-fun m!198281 () Bool)

(assert (=> d!41895 m!198281))

(assert (=> b!131057 d!41895))

(declare-fun d!41897 () Bool)

(assert (=> d!41897 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2744 (buf!3105 (_2!5958 lt!202113)))) ((_ sign_extend 32) (currentByte!5878 thiss!1634)) ((_ sign_extend 32) (currentBit!5873 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!202772 () Unit!8102)

(declare-fun choose!26 (BitStream!4752 array!6060 (_ BitVec 32) BitStream!4752) Unit!8102)

(assert (=> d!41897 (= lt!202772 (choose!26 thiss!1634 (buf!3105 (_2!5958 lt!202113)) (bvsub to!404 from!447) (BitStream!4753 (buf!3105 (_2!5958 lt!202113)) (currentByte!5878 thiss!1634) (currentBit!5873 thiss!1634))))))

(assert (=> d!41897 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3105 (_2!5958 lt!202113)) (bvsub to!404 from!447)) lt!202772)))

(declare-fun bs!10224 () Bool)

(assert (= bs!10224 d!41897))

(assert (=> bs!10224 m!197719))

(declare-fun m!198283 () Bool)

(assert (=> bs!10224 m!198283))

(assert (=> b!131057 d!41897))

(declare-fun b!131348 () Bool)

(declare-fun e!87043 () Unit!8102)

(declare-fun lt!202777 () Unit!8102)

(assert (=> b!131348 (= e!87043 lt!202777)))

(declare-fun lt!202787 () (_ BitVec 64))

(assert (=> b!131348 (= lt!202787 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!202773 () (_ BitVec 64))

(assert (=> b!131348 (= lt!202773 (bitIndex!0 (size!2744 (buf!3105 thiss!1634)) (currentByte!5878 thiss!1634) (currentBit!5873 thiss!1634)))))

(assert (=> b!131348 (= lt!202777 (arrayBitRangesEqSymmetric!0 (buf!3105 thiss!1634) (buf!3105 (_2!5958 lt!202113)) lt!202787 lt!202773))))

(assert (=> b!131348 (arrayBitRangesEq!0 (buf!3105 (_2!5958 lt!202113)) (buf!3105 thiss!1634) lt!202787 lt!202773)))

(declare-fun d!41899 () Bool)

(declare-fun e!87044 () Bool)

(assert (=> d!41899 e!87044))

(declare-fun res!108951 () Bool)

(assert (=> d!41899 (=> (not res!108951) (not e!87044))))

(declare-fun lt!202782 () tuple2!11318)

(assert (=> d!41899 (= res!108951 (isPrefixOf!0 (_1!5959 lt!202782) (_2!5959 lt!202782)))))

(declare-fun lt!202792 () BitStream!4752)

(assert (=> d!41899 (= lt!202782 (tuple2!11319 lt!202792 (_2!5958 lt!202113)))))

(declare-fun lt!202790 () Unit!8102)

(declare-fun lt!202784 () Unit!8102)

(assert (=> d!41899 (= lt!202790 lt!202784)))

(assert (=> d!41899 (isPrefixOf!0 lt!202792 (_2!5958 lt!202113))))

(assert (=> d!41899 (= lt!202784 (lemmaIsPrefixTransitive!0 lt!202792 (_2!5958 lt!202113) (_2!5958 lt!202113)))))

(declare-fun lt!202788 () Unit!8102)

(declare-fun lt!202780 () Unit!8102)

(assert (=> d!41899 (= lt!202788 lt!202780)))

(assert (=> d!41899 (isPrefixOf!0 lt!202792 (_2!5958 lt!202113))))

(assert (=> d!41899 (= lt!202780 (lemmaIsPrefixTransitive!0 lt!202792 thiss!1634 (_2!5958 lt!202113)))))

(declare-fun lt!202791 () Unit!8102)

(assert (=> d!41899 (= lt!202791 e!87043)))

(declare-fun c!7569 () Bool)

(assert (=> d!41899 (= c!7569 (not (= (size!2744 (buf!3105 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!202781 () Unit!8102)

(declare-fun lt!202785 () Unit!8102)

(assert (=> d!41899 (= lt!202781 lt!202785)))

(assert (=> d!41899 (isPrefixOf!0 (_2!5958 lt!202113) (_2!5958 lt!202113))))

(assert (=> d!41899 (= lt!202785 (lemmaIsPrefixRefl!0 (_2!5958 lt!202113)))))

(declare-fun lt!202778 () Unit!8102)

(declare-fun lt!202775 () Unit!8102)

(assert (=> d!41899 (= lt!202778 lt!202775)))

(assert (=> d!41899 (= lt!202775 (lemmaIsPrefixRefl!0 (_2!5958 lt!202113)))))

(declare-fun lt!202779 () Unit!8102)

(declare-fun lt!202789 () Unit!8102)

(assert (=> d!41899 (= lt!202779 lt!202789)))

(assert (=> d!41899 (isPrefixOf!0 lt!202792 lt!202792)))

(assert (=> d!41899 (= lt!202789 (lemmaIsPrefixRefl!0 lt!202792))))

(declare-fun lt!202786 () Unit!8102)

(declare-fun lt!202774 () Unit!8102)

(assert (=> d!41899 (= lt!202786 lt!202774)))

(assert (=> d!41899 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!41899 (= lt!202774 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!41899 (= lt!202792 (BitStream!4753 (buf!3105 (_2!5958 lt!202113)) (currentByte!5878 thiss!1634) (currentBit!5873 thiss!1634)))))

(assert (=> d!41899 (isPrefixOf!0 thiss!1634 (_2!5958 lt!202113))))

(assert (=> d!41899 (= (reader!0 thiss!1634 (_2!5958 lt!202113)) lt!202782)))

(declare-fun b!131349 () Bool)

(declare-fun Unit!8114 () Unit!8102)

(assert (=> b!131349 (= e!87043 Unit!8114)))

(declare-fun b!131350 () Bool)

(declare-fun res!108952 () Bool)

(assert (=> b!131350 (=> (not res!108952) (not e!87044))))

(assert (=> b!131350 (= res!108952 (isPrefixOf!0 (_2!5959 lt!202782) (_2!5958 lt!202113)))))

(declare-fun b!131351 () Bool)

(declare-fun res!108953 () Bool)

(assert (=> b!131351 (=> (not res!108953) (not e!87044))))

(assert (=> b!131351 (= res!108953 (isPrefixOf!0 (_1!5959 lt!202782) thiss!1634))))

(declare-fun b!131352 () Bool)

(declare-fun lt!202776 () (_ BitVec 64))

(declare-fun lt!202783 () (_ BitVec 64))

(assert (=> b!131352 (= e!87044 (= (_1!5959 lt!202782) (withMovedBitIndex!0 (_2!5959 lt!202782) (bvsub lt!202776 lt!202783))))))

(assert (=> b!131352 (or (= (bvand lt!202776 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!202783 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!202776 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!202776 lt!202783) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!131352 (= lt!202783 (bitIndex!0 (size!2744 (buf!3105 (_2!5958 lt!202113))) (currentByte!5878 (_2!5958 lt!202113)) (currentBit!5873 (_2!5958 lt!202113))))))

(assert (=> b!131352 (= lt!202776 (bitIndex!0 (size!2744 (buf!3105 thiss!1634)) (currentByte!5878 thiss!1634) (currentBit!5873 thiss!1634)))))

(assert (= (and d!41899 c!7569) b!131348))

(assert (= (and d!41899 (not c!7569)) b!131349))

(assert (= (and d!41899 res!108951) b!131351))

(assert (= (and b!131351 res!108953) b!131350))

(assert (= (and b!131350 res!108952) b!131352))

(assert (=> b!131348 m!197707))

(declare-fun m!198285 () Bool)

(assert (=> b!131348 m!198285))

(declare-fun m!198287 () Bool)

(assert (=> b!131348 m!198287))

(declare-fun m!198289 () Bool)

(assert (=> b!131351 m!198289))

(declare-fun m!198291 () Bool)

(assert (=> b!131352 m!198291))

(assert (=> b!131352 m!197755))

(assert (=> b!131352 m!197707))

(assert (=> d!41899 m!197747))

(assert (=> d!41899 m!198191))

(assert (=> d!41899 m!198227))

(assert (=> d!41899 m!198229))

(assert (=> d!41899 m!198197))

(declare-fun m!198293 () Bool)

(assert (=> d!41899 m!198293))

(declare-fun m!198295 () Bool)

(assert (=> d!41899 m!198295))

(declare-fun m!198297 () Bool)

(assert (=> d!41899 m!198297))

(declare-fun m!198299 () Bool)

(assert (=> d!41899 m!198299))

(declare-fun m!198301 () Bool)

(assert (=> d!41899 m!198301))

(declare-fun m!198303 () Bool)

(assert (=> d!41899 m!198303))

(declare-fun m!198305 () Bool)

(assert (=> b!131350 m!198305))

(assert (=> b!131057 d!41899))

(declare-fun d!41901 () Bool)

(declare-fun e!87047 () Bool)

(assert (=> d!41901 e!87047))

(declare-fun res!108956 () Bool)

(assert (=> d!41901 (=> (not res!108956) (not e!87047))))

(assert (=> d!41901 (= res!108956 (and (or (let ((rhs!3085 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3085 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3085) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!41902 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!41902 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!41902 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3084 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3084 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3084) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!202800 () Unit!8102)

(declare-fun choose!57 (BitStream!4752 BitStream!4752 (_ BitVec 64) (_ BitVec 32)) Unit!8102)

(assert (=> d!41901 (= lt!202800 (choose!57 thiss!1634 (_2!5958 lt!202106) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!41901 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5958 lt!202106) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!202800)))

(declare-fun b!131355 () Bool)

(declare-fun lt!202801 () (_ BitVec 32))

(assert (=> b!131355 (= e!87047 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2744 (buf!3105 (_2!5958 lt!202106)))) ((_ sign_extend 32) (currentByte!5878 (_2!5958 lt!202106))) ((_ sign_extend 32) (currentBit!5873 (_2!5958 lt!202106))) (bvsub (bvsub to!404 from!447) lt!202801)))))

(assert (=> b!131355 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!202801 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!202801) #b10000000000000000000000000000000)))))

(declare-fun lt!202799 () (_ BitVec 64))

(assert (=> b!131355 (= lt!202801 ((_ extract 31 0) lt!202799))))

(assert (=> b!131355 (and (bvslt lt!202799 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!202799 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!131355 (= lt!202799 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!41901 res!108956) b!131355))

(declare-fun m!198307 () Bool)

(assert (=> d!41901 m!198307))

(declare-fun m!198309 () Bool)

(assert (=> b!131355 m!198309))

(assert (=> b!131057 d!41901))

(declare-fun d!41904 () Bool)

(declare-fun e!87050 () Bool)

(assert (=> d!41904 e!87050))

(declare-fun res!108959 () Bool)

(assert (=> d!41904 (=> (not res!108959) (not e!87050))))

(declare-fun lt!202812 () tuple2!11320)

(declare-fun lt!202810 () tuple2!11320)

(assert (=> d!41904 (= res!108959 (= (bitIndex!0 (size!2744 (buf!3105 (_1!5960 lt!202812))) (currentByte!5878 (_1!5960 lt!202812)) (currentBit!5873 (_1!5960 lt!202812))) (bitIndex!0 (size!2744 (buf!3105 (_1!5960 lt!202810))) (currentByte!5878 (_1!5960 lt!202810)) (currentBit!5873 (_1!5960 lt!202810)))))))

(declare-fun lt!202813 () Unit!8102)

(declare-fun lt!202811 () BitStream!4752)

(declare-fun choose!14 (BitStream!4752 BitStream!4752 BitStream!4752 tuple2!11320 tuple2!11320 BitStream!4752 (_ BitVec 8) tuple2!11320 tuple2!11320 BitStream!4752 (_ BitVec 8)) Unit!8102)

(assert (=> d!41904 (= lt!202813 (choose!14 lt!202108 (_2!5958 lt!202113) lt!202811 lt!202812 (tuple2!11321 (_1!5960 lt!202812) (_2!5960 lt!202812)) (_1!5960 lt!202812) (_2!5960 lt!202812) lt!202810 (tuple2!11321 (_1!5960 lt!202810) (_2!5960 lt!202810)) (_1!5960 lt!202810) (_2!5960 lt!202810)))))

(assert (=> d!41904 (= lt!202810 (readBytePure!0 lt!202811))))

(assert (=> d!41904 (= lt!202812 (readBytePure!0 lt!202108))))

(assert (=> d!41904 (= lt!202811 (BitStream!4753 (buf!3105 (_2!5958 lt!202113)) (currentByte!5878 lt!202108) (currentBit!5873 lt!202108)))))

(assert (=> d!41904 (= (readBytePrefixLemma!0 lt!202108 (_2!5958 lt!202113)) lt!202813)))

(declare-fun b!131358 () Bool)

(assert (=> b!131358 (= e!87050 (= (_2!5960 lt!202812) (_2!5960 lt!202810)))))

(assert (= (and d!41904 res!108959) b!131358))

(declare-fun m!198311 () Bool)

(assert (=> d!41904 m!198311))

(assert (=> d!41904 m!197749))

(declare-fun m!198313 () Bool)

(assert (=> d!41904 m!198313))

(declare-fun m!198315 () Bool)

(assert (=> d!41904 m!198315))

(declare-fun m!198317 () Bool)

(assert (=> d!41904 m!198317))

(assert (=> b!131057 d!41904))

(declare-fun d!41906 () Bool)

(declare-fun e!87053 () Bool)

(assert (=> d!41906 e!87053))

(declare-fun res!108966 () Bool)

(assert (=> d!41906 (=> (not res!108966) (not e!87053))))

(declare-fun lt!202827 () tuple2!11316)

(assert (=> d!41906 (= res!108966 (= (size!2744 (buf!3105 thiss!1634)) (size!2744 (buf!3105 (_2!5958 lt!202827)))))))

(declare-fun choose!6 (BitStream!4752 (_ BitVec 8)) tuple2!11316)

(assert (=> d!41906 (= lt!202827 (choose!6 thiss!1634 (select (arr!3367 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!41906 (validate_offset_byte!0 ((_ sign_extend 32) (size!2744 (buf!3105 thiss!1634))) ((_ sign_extend 32) (currentByte!5878 thiss!1634)) ((_ sign_extend 32) (currentBit!5873 thiss!1634)))))

(assert (=> d!41906 (= (appendByte!0 thiss!1634 (select (arr!3367 arr!237) from!447)) lt!202827)))

(declare-fun b!131365 () Bool)

(declare-fun res!108968 () Bool)

(assert (=> b!131365 (=> (not res!108968) (not e!87053))))

(declare-fun lt!202824 () (_ BitVec 64))

(declare-fun lt!202825 () (_ BitVec 64))

(assert (=> b!131365 (= res!108968 (= (bitIndex!0 (size!2744 (buf!3105 (_2!5958 lt!202827))) (currentByte!5878 (_2!5958 lt!202827)) (currentBit!5873 (_2!5958 lt!202827))) (bvadd lt!202825 lt!202824)))))

(assert (=> b!131365 (or (not (= (bvand lt!202825 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!202824 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!202825 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!202825 lt!202824) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!131365 (= lt!202824 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!131365 (= lt!202825 (bitIndex!0 (size!2744 (buf!3105 thiss!1634)) (currentByte!5878 thiss!1634) (currentBit!5873 thiss!1634)))))

(declare-fun b!131366 () Bool)

(declare-fun res!108967 () Bool)

(assert (=> b!131366 (=> (not res!108967) (not e!87053))))

(assert (=> b!131366 (= res!108967 (isPrefixOf!0 thiss!1634 (_2!5958 lt!202827)))))

(declare-fun lt!202826 () tuple2!11318)

(declare-fun b!131367 () Bool)

(declare-fun lt!202828 () tuple2!11320)

(assert (=> b!131367 (= e!87053 (and (= (_2!5960 lt!202828) (select (arr!3367 arr!237) from!447)) (= (_1!5960 lt!202828) (_2!5959 lt!202826))))))

(assert (=> b!131367 (= lt!202828 (readBytePure!0 (_1!5959 lt!202826)))))

(assert (=> b!131367 (= lt!202826 (reader!0 thiss!1634 (_2!5958 lt!202827)))))

(assert (= (and d!41906 res!108966) b!131365))

(assert (= (and b!131365 res!108968) b!131366))

(assert (= (and b!131366 res!108967) b!131367))

(assert (=> d!41906 m!197711))

(declare-fun m!198319 () Bool)

(assert (=> d!41906 m!198319))

(declare-fun m!198321 () Bool)

(assert (=> d!41906 m!198321))

(declare-fun m!198323 () Bool)

(assert (=> b!131365 m!198323))

(assert (=> b!131365 m!197707))

(declare-fun m!198325 () Bool)

(assert (=> b!131366 m!198325))

(declare-fun m!198327 () Bool)

(assert (=> b!131367 m!198327))

(declare-fun m!198329 () Bool)

(assert (=> b!131367 m!198329))

(assert (=> b!131057 d!41906))

(declare-fun d!41908 () Bool)

(assert (=> d!41908 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2744 (buf!3105 (_2!5958 lt!202106)))) ((_ sign_extend 32) (currentByte!5878 (_2!5958 lt!202106))) ((_ sign_extend 32) (currentBit!5873 (_2!5958 lt!202106))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2744 (buf!3105 (_2!5958 lt!202106)))) ((_ sign_extend 32) (currentByte!5878 (_2!5958 lt!202106))) ((_ sign_extend 32) (currentBit!5873 (_2!5958 lt!202106)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10225 () Bool)

(assert (= bs!10225 d!41908))

(assert (=> bs!10225 m!198247))

(assert (=> b!131057 d!41908))

(declare-fun d!41910 () Bool)

(declare-fun res!108971 () Bool)

(declare-fun e!87055 () Bool)

(assert (=> d!41910 (=> (not res!108971) (not e!87055))))

(assert (=> d!41910 (= res!108971 (= (size!2744 (buf!3105 thiss!1634)) (size!2744 (buf!3105 (_2!5958 lt!202113)))))))

(assert (=> d!41910 (= (isPrefixOf!0 thiss!1634 (_2!5958 lt!202113)) e!87055)))

(declare-fun b!131368 () Bool)

(declare-fun res!108970 () Bool)

(assert (=> b!131368 (=> (not res!108970) (not e!87055))))

(assert (=> b!131368 (= res!108970 (bvsle (bitIndex!0 (size!2744 (buf!3105 thiss!1634)) (currentByte!5878 thiss!1634) (currentBit!5873 thiss!1634)) (bitIndex!0 (size!2744 (buf!3105 (_2!5958 lt!202113))) (currentByte!5878 (_2!5958 lt!202113)) (currentBit!5873 (_2!5958 lt!202113)))))))

(declare-fun b!131369 () Bool)

(declare-fun e!87054 () Bool)

(assert (=> b!131369 (= e!87055 e!87054)))

(declare-fun res!108969 () Bool)

(assert (=> b!131369 (=> res!108969 e!87054)))

(assert (=> b!131369 (= res!108969 (= (size!2744 (buf!3105 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!131370 () Bool)

(assert (=> b!131370 (= e!87054 (arrayBitRangesEq!0 (buf!3105 thiss!1634) (buf!3105 (_2!5958 lt!202113)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2744 (buf!3105 thiss!1634)) (currentByte!5878 thiss!1634) (currentBit!5873 thiss!1634))))))

(assert (= (and d!41910 res!108971) b!131368))

(assert (= (and b!131368 res!108970) b!131369))

(assert (= (and b!131369 (not res!108969)) b!131370))

(assert (=> b!131368 m!197707))

(assert (=> b!131368 m!197755))

(assert (=> b!131370 m!197707))

(assert (=> b!131370 m!197707))

(declare-fun m!198331 () Bool)

(assert (=> b!131370 m!198331))

(assert (=> b!131057 d!41910))

(declare-fun d!41912 () Bool)

(assert (=> d!41912 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2744 (buf!3105 (_2!5958 lt!202113)))) ((_ sign_extend 32) (currentByte!5878 thiss!1634)) ((_ sign_extend 32) (currentBit!5873 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2744 (buf!3105 (_2!5958 lt!202113)))) ((_ sign_extend 32) (currentByte!5878 thiss!1634)) ((_ sign_extend 32) (currentBit!5873 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10226 () Bool)

(assert (= bs!10226 d!41912))

(declare-fun m!198333 () Bool)

(assert (=> bs!10226 m!198333))

(assert (=> b!131057 d!41912))

(declare-fun d!41914 () Bool)

(declare-fun e!87056 () Bool)

(assert (=> d!41914 e!87056))

(declare-fun res!108973 () Bool)

(assert (=> d!41914 (=> (not res!108973) (not e!87056))))

(declare-fun lt!202831 () (_ BitVec 64))

(declare-fun lt!202829 () (_ BitVec 64))

(declare-fun lt!202830 () (_ BitVec 64))

(assert (=> d!41914 (= res!108973 (= lt!202830 (bvsub lt!202831 lt!202829)))))

(assert (=> d!41914 (or (= (bvand lt!202831 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!202829 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!202831 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!202831 lt!202829) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41914 (= lt!202829 (remainingBits!0 ((_ sign_extend 32) (size!2744 (buf!3105 (_1!5960 lt!202110)))) ((_ sign_extend 32) (currentByte!5878 (_1!5960 lt!202110))) ((_ sign_extend 32) (currentBit!5873 (_1!5960 lt!202110)))))))

(declare-fun lt!202833 () (_ BitVec 64))

(declare-fun lt!202832 () (_ BitVec 64))

(assert (=> d!41914 (= lt!202831 (bvmul lt!202833 lt!202832))))

(assert (=> d!41914 (or (= lt!202833 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!202832 (bvsdiv (bvmul lt!202833 lt!202832) lt!202833)))))

(assert (=> d!41914 (= lt!202832 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41914 (= lt!202833 ((_ sign_extend 32) (size!2744 (buf!3105 (_1!5960 lt!202110)))))))

(assert (=> d!41914 (= lt!202830 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5878 (_1!5960 lt!202110))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5873 (_1!5960 lt!202110)))))))

(assert (=> d!41914 (invariant!0 (currentBit!5873 (_1!5960 lt!202110)) (currentByte!5878 (_1!5960 lt!202110)) (size!2744 (buf!3105 (_1!5960 lt!202110))))))

(assert (=> d!41914 (= (bitIndex!0 (size!2744 (buf!3105 (_1!5960 lt!202110))) (currentByte!5878 (_1!5960 lt!202110)) (currentBit!5873 (_1!5960 lt!202110))) lt!202830)))

(declare-fun b!131371 () Bool)

(declare-fun res!108972 () Bool)

(assert (=> b!131371 (=> (not res!108972) (not e!87056))))

(assert (=> b!131371 (= res!108972 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!202830))))

(declare-fun b!131372 () Bool)

(declare-fun lt!202834 () (_ BitVec 64))

(assert (=> b!131372 (= e!87056 (bvsle lt!202830 (bvmul lt!202834 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!131372 (or (= lt!202834 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!202834 #b0000000000000000000000000000000000000000000000000000000000001000) lt!202834)))))

(assert (=> b!131372 (= lt!202834 ((_ sign_extend 32) (size!2744 (buf!3105 (_1!5960 lt!202110)))))))

(assert (= (and d!41914 res!108973) b!131371))

(assert (= (and b!131371 res!108972) b!131372))

(declare-fun m!198335 () Bool)

(assert (=> d!41914 m!198335))

(declare-fun m!198337 () Bool)

(assert (=> d!41914 m!198337))

(assert (=> b!131057 d!41914))

(declare-fun d!41916 () Bool)

(declare-fun lt!202835 () tuple2!11336)

(assert (=> d!41916 (= lt!202835 (readByte!0 lt!202108))))

(assert (=> d!41916 (= (readBytePure!0 lt!202108) (tuple2!11321 (_2!5970 lt!202835) (_1!5970 lt!202835)))))

(declare-fun bs!10227 () Bool)

(assert (= bs!10227 d!41916))

(declare-fun m!198339 () Bool)

(assert (=> bs!10227 m!198339))

(assert (=> b!131057 d!41916))

(declare-fun d!41918 () Bool)

(assert (=> d!41918 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2744 (buf!3105 (_1!5959 lt!202111)))) ((_ sign_extend 32) (currentByte!5878 (_1!5959 lt!202111))) ((_ sign_extend 32) (currentBit!5873 (_1!5959 lt!202111))) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2744 (buf!3105 (_1!5959 lt!202111)))) ((_ sign_extend 32) (currentByte!5878 (_1!5959 lt!202111))) ((_ sign_extend 32) (currentBit!5873 (_1!5959 lt!202111)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10228 () Bool)

(assert (= bs!10228 d!41918))

(declare-fun m!198341 () Bool)

(assert (=> bs!10228 m!198341))

(assert (=> b!131057 d!41918))

(declare-fun d!41920 () Bool)

(assert (=> d!41920 (= (array_inv!2533 arr!237) (bvsge (size!2744 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!25680 d!41920))

(declare-fun d!41922 () Bool)

(assert (=> d!41922 (= (inv!12 thiss!1634) (invariant!0 (currentBit!5873 thiss!1634) (currentByte!5878 thiss!1634) (size!2744 (buf!3105 thiss!1634))))))

(declare-fun bs!10229 () Bool)

(assert (= bs!10229 d!41922))

(assert (=> bs!10229 m!197709))

(assert (=> start!25680 d!41922))

(check-sat (not b!131350) (not b!131352) (not d!41918) (not b!131347) (not b!131343) (not d!41912) (not d!41891) (not d!41906) (not b!131297) (not b!131346) (not d!41899) (not b!131370) (not b!131348) (not b!131316) (not b!131367) (not d!41865) (not d!41871) (not d!41883) (not b!131310) (not d!41893) (not d!41897) (not b!131308) (not b!131313) (not d!41916) (not b!131315) (not b!131366) (not d!41867) (not b!131345) (not d!41887) (not b!131312) (not d!41908) (not b!131295) (not d!41901) (not d!41895) (not d!41904) (not b!131365) (not b!131317) (not d!41889) (not d!41881) (not d!41873) (not d!41879) (not d!41922) (not b!131320) (not d!41857) (not b!131368) (not d!41869) (not b!131344) (not b!131355) (not b!131311) (not b!131351) (not d!41914) (not b!131288) (not b!131318) (not d!41863))
(check-sat)
