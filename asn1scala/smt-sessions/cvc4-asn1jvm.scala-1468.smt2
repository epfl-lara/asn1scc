; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40224 () Bool)

(assert start!40224)

(declare-fun b!184669 () Bool)

(declare-fun e!127924 () Bool)

(declare-fun e!127928 () Bool)

(assert (=> b!184669 (= e!127924 e!127928)))

(declare-fun res!153669 () Bool)

(assert (=> b!184669 (=> (not res!153669) (not e!127928))))

(declare-datatypes ((array!9792 0))(
  ( (array!9793 (arr!5250 (Array (_ BitVec 32) (_ BitVec 8))) (size!4320 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7748 0))(
  ( (BitStream!7749 (buf!4775 array!9792) (currentByte!9009 (_ BitVec 32)) (currentBit!9004 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7748)

(declare-fun lt!283976 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!184669 (= res!153669 (validate_offset_bits!1 ((_ sign_extend 32) (size!4320 (buf!4775 thiss!1204))) ((_ sign_extend 32) (currentByte!9009 thiss!1204)) ((_ sign_extend 32) (currentBit!9004 thiss!1204)) lt!283976))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!184669 (= lt!283976 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!184670 () Bool)

(declare-fun res!153679 () Bool)

(declare-fun e!127926 () Bool)

(assert (=> b!184670 (=> res!153679 e!127926)))

(declare-datatypes ((Unit!13215 0))(
  ( (Unit!13216) )
))
(declare-datatypes ((tuple2!15996 0))(
  ( (tuple2!15997 (_1!8643 Unit!13215) (_2!8643 BitStream!7748)) )
))
(declare-fun lt!283991 () tuple2!15996)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!184670 (= res!153679 (not (invariant!0 (currentBit!9004 (_2!8643 lt!283991)) (currentByte!9009 (_2!8643 lt!283991)) (size!4320 (buf!4775 (_2!8643 lt!283991))))))))

(declare-fun b!184671 () Bool)

(declare-fun e!127922 () Bool)

(declare-datatypes ((tuple2!15998 0))(
  ( (tuple2!15999 (_1!8644 BitStream!7748) (_2!8644 Bool)) )
))
(declare-fun lt!283977 () tuple2!15998)

(declare-fun lt!283992 () tuple2!15998)

(assert (=> b!184671 (= e!127922 (= (_2!8644 lt!283977) (_2!8644 lt!283992)))))

(declare-fun b!184672 () Bool)

(declare-fun e!127927 () Bool)

(declare-fun e!127919 () Bool)

(assert (=> b!184672 (= e!127927 e!127919)))

(declare-fun res!153667 () Bool)

(assert (=> b!184672 (=> (not res!153667) (not e!127919))))

(declare-fun lt!283975 () (_ BitVec 64))

(declare-fun lt!283973 () (_ BitVec 64))

(assert (=> b!184672 (= res!153667 (= lt!283975 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!283973)))))

(declare-fun lt!283974 () tuple2!15996)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!184672 (= lt!283975 (bitIndex!0 (size!4320 (buf!4775 (_2!8643 lt!283974))) (currentByte!9009 (_2!8643 lt!283974)) (currentBit!9004 (_2!8643 lt!283974))))))

(assert (=> b!184672 (= lt!283973 (bitIndex!0 (size!4320 (buf!4775 thiss!1204)) (currentByte!9009 thiss!1204) (currentBit!9004 thiss!1204)))))

(declare-fun b!184673 () Bool)

(declare-fun res!153672 () Bool)

(assert (=> b!184673 (=> res!153672 e!127926)))

(declare-fun isPrefixOf!0 (BitStream!7748 BitStream!7748) Bool)

(assert (=> b!184673 (= res!153672 (not (isPrefixOf!0 (_2!8643 lt!283974) (_2!8643 lt!283991))))))

(declare-fun b!184674 () Bool)

(declare-fun e!127929 () Bool)

(assert (=> b!184674 (= e!127928 (not e!127929))))

(declare-fun res!153680 () Bool)

(assert (=> b!184674 (=> res!153680 e!127929)))

(declare-fun lt!283979 () (_ BitVec 64))

(declare-fun lt!283989 () (_ BitVec 64))

(assert (=> b!184674 (= res!153680 (not (= lt!283979 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!283989))))))

(assert (=> b!184674 (= lt!283979 (bitIndex!0 (size!4320 (buf!4775 (_2!8643 lt!283974))) (currentByte!9009 (_2!8643 lt!283974)) (currentBit!9004 (_2!8643 lt!283974))))))

(assert (=> b!184674 (= lt!283989 (bitIndex!0 (size!4320 (buf!4775 thiss!1204)) (currentByte!9009 thiss!1204) (currentBit!9004 thiss!1204)))))

(assert (=> b!184674 e!127927))

(declare-fun res!153681 () Bool)

(assert (=> b!184674 (=> (not res!153681) (not e!127927))))

(assert (=> b!184674 (= res!153681 (= (size!4320 (buf!4775 thiss!1204)) (size!4320 (buf!4775 (_2!8643 lt!283974)))))))

(declare-fun lt!283981 () Bool)

(declare-fun appendBit!0 (BitStream!7748 Bool) tuple2!15996)

(assert (=> b!184674 (= lt!283974 (appendBit!0 thiss!1204 lt!283981))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!283985 () (_ BitVec 64))

(assert (=> b!184674 (= lt!283981 (not (= (bvand v!189 lt!283985) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!184674 (= lt!283985 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!184676 () Bool)

(declare-fun e!127921 () Bool)

(declare-fun lt!283972 () tuple2!15998)

(assert (=> b!184676 (= e!127921 (= (bitIndex!0 (size!4320 (buf!4775 (_1!8644 lt!283972))) (currentByte!9009 (_1!8644 lt!283972)) (currentBit!9004 (_1!8644 lt!283972))) lt!283975))))

(declare-fun e!127925 () Bool)

(declare-fun lt!283984 () (_ BitVec 64))

(declare-fun b!184677 () Bool)

(declare-datatypes ((tuple2!16000 0))(
  ( (tuple2!16001 (_1!8645 BitStream!7748) (_2!8645 BitStream!7748)) )
))
(declare-fun lt!283971 () tuple2!16000)

(declare-fun moveBitIndexPrecond!0 (BitStream!7748 (_ BitVec 64)) Bool)

(assert (=> b!184677 (= e!127925 (moveBitIndexPrecond!0 (_2!8645 lt!283971) (bvsub lt!283989 lt!283984)))))

(declare-datatypes ((tuple2!16002 0))(
  ( (tuple2!16003 (_1!8646 BitStream!7748) (_2!8646 (_ BitVec 64))) )
))
(declare-fun lt!283993 () tuple2!16002)

(declare-fun lt!283994 () tuple2!16002)

(assert (=> b!184677 (and (= (_2!8646 lt!283993) (_2!8646 lt!283994)) (= (_1!8646 lt!283993) (_1!8646 lt!283994)))))

(declare-fun lt!283978 () Unit!13215)

(declare-fun lt!283980 () (_ BitVec 64))

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7748 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13215)

(assert (=> b!184677 (= lt!283978 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8645 lt!283971) nBits!348 i!590 lt!283980))))

(declare-fun lt!283987 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7748 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16002)

(declare-fun withMovedBitIndex!0 (BitStream!7748 (_ BitVec 64)) BitStream!7748)

(assert (=> b!184677 (= lt!283994 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8645 lt!283971) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!283987))))

(declare-fun b!184678 () Bool)

(declare-fun res!153673 () Bool)

(assert (=> b!184678 (=> (not res!153673) (not e!127928))))

(assert (=> b!184678 (= res!153673 (invariant!0 (currentBit!9004 thiss!1204) (currentByte!9009 thiss!1204) (size!4320 (buf!4775 thiss!1204))))))

(declare-fun b!184679 () Bool)

(assert (=> b!184679 (= e!127929 e!127926)))

(declare-fun res!153675 () Bool)

(assert (=> b!184679 (=> res!153675 e!127926)))

(assert (=> b!184679 (= res!153675 (not (= lt!283984 (bvsub (bvsub (bvadd lt!283979 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!184679 (= lt!283984 (bitIndex!0 (size!4320 (buf!4775 (_2!8643 lt!283991))) (currentByte!9009 (_2!8643 lt!283991)) (currentBit!9004 (_2!8643 lt!283991))))))

(assert (=> b!184679 (isPrefixOf!0 thiss!1204 (_2!8643 lt!283991))))

(declare-fun lt!283995 () Unit!13215)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7748 BitStream!7748 BitStream!7748) Unit!13215)

(assert (=> b!184679 (= lt!283995 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8643 lt!283974) (_2!8643 lt!283991)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7748 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15996)

(assert (=> b!184679 (= lt!283991 (appendBitsLSBFirstLoopTR!0 (_2!8643 lt!283974) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!184680 () Bool)

(declare-fun res!153665 () Bool)

(assert (=> b!184680 (=> res!153665 e!127926)))

(assert (=> b!184680 (= res!153665 (not (isPrefixOf!0 thiss!1204 (_2!8643 lt!283974))))))

(declare-fun b!184681 () Bool)

(assert (=> b!184681 (= e!127926 e!127925)))

(declare-fun res!153670 () Bool)

(assert (=> b!184681 (=> res!153670 e!127925)))

(declare-fun lt!283982 () tuple2!16000)

(assert (=> b!184681 (= res!153670 (not (= (_1!8646 (readNBitsLSBFirstsLoopPure!0 (_1!8645 lt!283982) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!283987)) (_2!8645 lt!283982))))))

(declare-fun lt!283983 () (_ BitVec 64))

(assert (=> b!184681 (validate_offset_bits!1 ((_ sign_extend 32) (size!4320 (buf!4775 (_2!8643 lt!283991)))) ((_ sign_extend 32) (currentByte!9009 (_2!8643 lt!283974))) ((_ sign_extend 32) (currentBit!9004 (_2!8643 lt!283974))) lt!283983)))

(declare-fun lt!283997 () Unit!13215)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7748 array!9792 (_ BitVec 64)) Unit!13215)

(assert (=> b!184681 (= lt!283997 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8643 lt!283974) (buf!4775 (_2!8643 lt!283991)) lt!283983))))

(assert (=> b!184681 (= lt!283983 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!283988 () tuple2!15998)

(assert (=> b!184681 (= lt!283987 (bvor lt!283980 (ite (_2!8644 lt!283988) lt!283985 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!184681 (= lt!283993 (readNBitsLSBFirstsLoopPure!0 (_1!8645 lt!283971) nBits!348 i!590 lt!283980))))

(assert (=> b!184681 (validate_offset_bits!1 ((_ sign_extend 32) (size!4320 (buf!4775 (_2!8643 lt!283991)))) ((_ sign_extend 32) (currentByte!9009 thiss!1204)) ((_ sign_extend 32) (currentBit!9004 thiss!1204)) lt!283976)))

(declare-fun lt!283990 () Unit!13215)

(assert (=> b!184681 (= lt!283990 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4775 (_2!8643 lt!283991)) lt!283976))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!184681 (= lt!283980 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!184681 (= (_2!8644 lt!283988) lt!283981)))

(declare-fun readBitPure!0 (BitStream!7748) tuple2!15998)

(assert (=> b!184681 (= lt!283988 (readBitPure!0 (_1!8645 lt!283971)))))

(declare-fun reader!0 (BitStream!7748 BitStream!7748) tuple2!16000)

(assert (=> b!184681 (= lt!283982 (reader!0 (_2!8643 lt!283974) (_2!8643 lt!283991)))))

(assert (=> b!184681 (= lt!283971 (reader!0 thiss!1204 (_2!8643 lt!283991)))))

(assert (=> b!184681 e!127922))

(declare-fun res!153676 () Bool)

(assert (=> b!184681 (=> (not res!153676) (not e!127922))))

(assert (=> b!184681 (= res!153676 (= (bitIndex!0 (size!4320 (buf!4775 (_1!8644 lt!283977))) (currentByte!9009 (_1!8644 lt!283977)) (currentBit!9004 (_1!8644 lt!283977))) (bitIndex!0 (size!4320 (buf!4775 (_1!8644 lt!283992))) (currentByte!9009 (_1!8644 lt!283992)) (currentBit!9004 (_1!8644 lt!283992)))))))

(declare-fun lt!283996 () Unit!13215)

(declare-fun lt!283986 () BitStream!7748)

(declare-fun readBitPrefixLemma!0 (BitStream!7748 BitStream!7748) Unit!13215)

(assert (=> b!184681 (= lt!283996 (readBitPrefixLemma!0 lt!283986 (_2!8643 lt!283991)))))

(assert (=> b!184681 (= lt!283992 (readBitPure!0 (BitStream!7749 (buf!4775 (_2!8643 lt!283991)) (currentByte!9009 thiss!1204) (currentBit!9004 thiss!1204))))))

(assert (=> b!184681 (= lt!283977 (readBitPure!0 lt!283986))))

(declare-fun e!127920 () Bool)

(assert (=> b!184681 e!127920))

(declare-fun res!153668 () Bool)

(assert (=> b!184681 (=> (not res!153668) (not e!127920))))

(assert (=> b!184681 (= res!153668 (invariant!0 (currentBit!9004 thiss!1204) (currentByte!9009 thiss!1204) (size!4320 (buf!4775 (_2!8643 lt!283974)))))))

(assert (=> b!184681 (= lt!283986 (BitStream!7749 (buf!4775 (_2!8643 lt!283974)) (currentByte!9009 thiss!1204) (currentBit!9004 thiss!1204)))))

(declare-fun b!184682 () Bool)

(declare-fun res!153677 () Bool)

(assert (=> b!184682 (=> (not res!153677) (not e!127919))))

(assert (=> b!184682 (= res!153677 (isPrefixOf!0 thiss!1204 (_2!8643 lt!283974)))))

(declare-fun b!184683 () Bool)

(declare-fun e!127923 () Bool)

(declare-fun array_inv!4061 (array!9792) Bool)

(assert (=> b!184683 (= e!127923 (array_inv!4061 (buf!4775 thiss!1204)))))

(declare-fun b!184684 () Bool)

(declare-fun res!153674 () Bool)

(assert (=> b!184684 (=> res!153674 e!127926)))

(assert (=> b!184684 (= res!153674 (or (not (= (size!4320 (buf!4775 (_2!8643 lt!283991))) (size!4320 (buf!4775 thiss!1204)))) (not (= lt!283984 (bvsub (bvadd lt!283989 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun res!153678 () Bool)

(assert (=> start!40224 (=> (not res!153678) (not e!127924))))

(assert (=> start!40224 (= res!153678 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40224 e!127924))

(assert (=> start!40224 true))

(declare-fun inv!12 (BitStream!7748) Bool)

(assert (=> start!40224 (and (inv!12 thiss!1204) e!127923)))

(declare-fun b!184675 () Bool)

(assert (=> b!184675 (= e!127920 (invariant!0 (currentBit!9004 thiss!1204) (currentByte!9009 thiss!1204) (size!4320 (buf!4775 (_2!8643 lt!283991)))))))

(declare-fun b!184685 () Bool)

(assert (=> b!184685 (= e!127919 e!127921)))

(declare-fun res!153671 () Bool)

(assert (=> b!184685 (=> (not res!153671) (not e!127921))))

(assert (=> b!184685 (= res!153671 (and (= (_2!8644 lt!283972) lt!283981) (= (_1!8644 lt!283972) (_2!8643 lt!283974))))))

(declare-fun readerFrom!0 (BitStream!7748 (_ BitVec 32) (_ BitVec 32)) BitStream!7748)

(assert (=> b!184685 (= lt!283972 (readBitPure!0 (readerFrom!0 (_2!8643 lt!283974) (currentBit!9004 thiss!1204) (currentByte!9009 thiss!1204))))))

(declare-fun b!184686 () Bool)

(declare-fun res!153666 () Bool)

(assert (=> b!184686 (=> (not res!153666) (not e!127928))))

(assert (=> b!184686 (= res!153666 (not (= i!590 nBits!348)))))

(assert (= (and start!40224 res!153678) b!184669))

(assert (= (and b!184669 res!153669) b!184678))

(assert (= (and b!184678 res!153673) b!184686))

(assert (= (and b!184686 res!153666) b!184674))

(assert (= (and b!184674 res!153681) b!184672))

(assert (= (and b!184672 res!153667) b!184682))

(assert (= (and b!184682 res!153677) b!184685))

(assert (= (and b!184685 res!153671) b!184676))

(assert (= (and b!184674 (not res!153680)) b!184679))

(assert (= (and b!184679 (not res!153675)) b!184670))

(assert (= (and b!184670 (not res!153679)) b!184684))

(assert (= (and b!184684 (not res!153674)) b!184673))

(assert (= (and b!184673 (not res!153672)) b!184680))

(assert (= (and b!184680 (not res!153665)) b!184681))

(assert (= (and b!184681 res!153668) b!184675))

(assert (= (and b!184681 res!153676) b!184671))

(assert (= (and b!184681 (not res!153670)) b!184677))

(assert (= start!40224 b!184683))

(declare-fun m!286881 () Bool)

(assert (=> b!184672 m!286881))

(declare-fun m!286883 () Bool)

(assert (=> b!184672 m!286883))

(declare-fun m!286885 () Bool)

(assert (=> b!184683 m!286885))

(declare-fun m!286887 () Bool)

(assert (=> b!184685 m!286887))

(assert (=> b!184685 m!286887))

(declare-fun m!286889 () Bool)

(assert (=> b!184685 m!286889))

(declare-fun m!286891 () Bool)

(assert (=> b!184682 m!286891))

(declare-fun m!286893 () Bool)

(assert (=> b!184676 m!286893))

(assert (=> b!184674 m!286881))

(assert (=> b!184674 m!286883))

(declare-fun m!286895 () Bool)

(assert (=> b!184674 m!286895))

(declare-fun m!286897 () Bool)

(assert (=> start!40224 m!286897))

(declare-fun m!286899 () Bool)

(assert (=> b!184677 m!286899))

(declare-fun m!286901 () Bool)

(assert (=> b!184677 m!286901))

(declare-fun m!286903 () Bool)

(assert (=> b!184677 m!286903))

(assert (=> b!184677 m!286903))

(declare-fun m!286905 () Bool)

(assert (=> b!184677 m!286905))

(declare-fun m!286907 () Bool)

(assert (=> b!184670 m!286907))

(declare-fun m!286909 () Bool)

(assert (=> b!184669 m!286909))

(declare-fun m!286911 () Bool)

(assert (=> b!184681 m!286911))

(declare-fun m!286913 () Bool)

(assert (=> b!184681 m!286913))

(declare-fun m!286915 () Bool)

(assert (=> b!184681 m!286915))

(declare-fun m!286917 () Bool)

(assert (=> b!184681 m!286917))

(declare-fun m!286919 () Bool)

(assert (=> b!184681 m!286919))

(declare-fun m!286921 () Bool)

(assert (=> b!184681 m!286921))

(declare-fun m!286923 () Bool)

(assert (=> b!184681 m!286923))

(declare-fun m!286925 () Bool)

(assert (=> b!184681 m!286925))

(declare-fun m!286927 () Bool)

(assert (=> b!184681 m!286927))

(declare-fun m!286929 () Bool)

(assert (=> b!184681 m!286929))

(declare-fun m!286931 () Bool)

(assert (=> b!184681 m!286931))

(declare-fun m!286933 () Bool)

(assert (=> b!184681 m!286933))

(declare-fun m!286935 () Bool)

(assert (=> b!184681 m!286935))

(declare-fun m!286937 () Bool)

(assert (=> b!184681 m!286937))

(declare-fun m!286939 () Bool)

(assert (=> b!184681 m!286939))

(declare-fun m!286941 () Bool)

(assert (=> b!184681 m!286941))

(declare-fun m!286943 () Bool)

(assert (=> b!184675 m!286943))

(assert (=> b!184680 m!286891))

(declare-fun m!286945 () Bool)

(assert (=> b!184678 m!286945))

(declare-fun m!286947 () Bool)

(assert (=> b!184679 m!286947))

(declare-fun m!286949 () Bool)

(assert (=> b!184679 m!286949))

(declare-fun m!286951 () Bool)

(assert (=> b!184679 m!286951))

(declare-fun m!286953 () Bool)

(assert (=> b!184679 m!286953))

(declare-fun m!286955 () Bool)

(assert (=> b!184673 m!286955))

(push 1)

(assert (not b!184673))

(assert (not b!184682))

(assert (not b!184674))

(assert (not b!184675))

(assert (not b!184685))

(assert (not b!184672))

(assert (not b!184679))

(assert (not b!184680))

(assert (not start!40224))

(assert (not b!184676))

(assert (not b!184678))

(assert (not b!184669))

(assert (not b!184683))

(assert (not b!184677))

(assert (not b!184681))

(assert (not b!184670))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!63771 () Bool)

(declare-fun res!153806 () Bool)

(declare-fun e!128010 () Bool)

(assert (=> d!63771 (=> (not res!153806) (not e!128010))))

(assert (=> d!63771 (= res!153806 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4320 (buf!4775 (_2!8645 lt!283971))))) (bvsub lt!283989 lt!283984)) (bvsle (bvsub lt!283989 lt!283984) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4320 (buf!4775 (_2!8645 lt!283971))))))))))

(assert (=> d!63771 (= (moveBitIndexPrecond!0 (_2!8645 lt!283971) (bvsub lt!283989 lt!283984)) e!128010)))

(declare-fun b!184830 () Bool)

(declare-fun lt!284353 () (_ BitVec 64))

(assert (=> b!184830 (= e!128010 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!284353) (bvsle lt!284353 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4320 (buf!4775 (_2!8645 lt!283971))))))))))

(assert (=> b!184830 (= lt!284353 (bvadd (bitIndex!0 (size!4320 (buf!4775 (_2!8645 lt!283971))) (currentByte!9009 (_2!8645 lt!283971)) (currentBit!9004 (_2!8645 lt!283971))) (bvsub lt!283989 lt!283984)))))

(assert (= (and d!63771 res!153806) b!184830))

(declare-fun m!287219 () Bool)

(assert (=> b!184830 m!287219))

(assert (=> b!184677 d!63771))

(declare-fun d!63773 () Bool)

(declare-fun lt!284369 () tuple2!16002)

(declare-fun lt!284368 () tuple2!16002)

(assert (=> d!63773 (and (= (_2!8646 lt!284369) (_2!8646 lt!284368)) (= (_1!8646 lt!284369) (_1!8646 lt!284368)))))

(declare-fun lt!284367 () (_ BitVec 64))

(declare-fun lt!284370 () BitStream!7748)

(declare-fun lt!284371 () Unit!13215)

(declare-fun lt!284366 () Bool)

(declare-fun choose!56 (BitStream!7748 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!16002 tuple2!16002 BitStream!7748 (_ BitVec 64) Bool BitStream!7748 (_ BitVec 64) tuple2!16002 tuple2!16002 BitStream!7748 (_ BitVec 64)) Unit!13215)

(assert (=> d!63773 (= lt!284371 (choose!56 (_1!8645 lt!283971) nBits!348 i!590 lt!283980 lt!284369 (tuple2!16003 (_1!8646 lt!284369) (_2!8646 lt!284369)) (_1!8646 lt!284369) (_2!8646 lt!284369) lt!284366 lt!284370 lt!284367 lt!284368 (tuple2!16003 (_1!8646 lt!284368) (_2!8646 lt!284368)) (_1!8646 lt!284368) (_2!8646 lt!284368)))))

(assert (=> d!63773 (= lt!284368 (readNBitsLSBFirstsLoopPure!0 lt!284370 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!284367))))

(assert (=> d!63773 (= lt!284367 (bvor lt!283980 (ite lt!284366 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63773 (= lt!284370 (withMovedBitIndex!0 (_1!8645 lt!283971) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!63773 (= lt!284366 (_2!8644 (readBitPure!0 (_1!8645 lt!283971))))))

(assert (=> d!63773 (= lt!284369 (readNBitsLSBFirstsLoopPure!0 (_1!8645 lt!283971) nBits!348 i!590 lt!283980))))

(assert (=> d!63773 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8645 lt!283971) nBits!348 i!590 lt!283980) lt!284371)))

(declare-fun bs!15882 () Bool)

(assert (= bs!15882 d!63773))

(assert (=> bs!15882 m!286925))

(declare-fun m!287221 () Bool)

(assert (=> bs!15882 m!287221))

(declare-fun m!287223 () Bool)

(assert (=> bs!15882 m!287223))

(assert (=> bs!15882 m!286927))

(assert (=> bs!15882 m!286903))

(assert (=> b!184677 d!63773))

(declare-datatypes ((tuple2!16012 0))(
  ( (tuple2!16013 (_1!8651 (_ BitVec 64)) (_2!8651 BitStream!7748)) )
))
(declare-fun lt!284374 () tuple2!16012)

(declare-fun d!63775 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!7748 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16012)

(assert (=> d!63775 (= lt!284374 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 (_1!8645 lt!283971) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!283987))))

(assert (=> d!63775 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8645 lt!283971) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!283987) (tuple2!16003 (_2!8651 lt!284374) (_1!8651 lt!284374)))))

(declare-fun bs!15883 () Bool)

(assert (= bs!15883 d!63775))

(assert (=> bs!15883 m!286903))

(declare-fun m!287225 () Bool)

(assert (=> bs!15883 m!287225))

(assert (=> b!184677 d!63775))

(declare-fun d!63777 () Bool)

(declare-fun e!128013 () Bool)

(assert (=> d!63777 e!128013))

(declare-fun res!153809 () Bool)

(assert (=> d!63777 (=> (not res!153809) (not e!128013))))

(declare-fun lt!284380 () (_ BitVec 64))

(declare-fun lt!284379 () BitStream!7748)

(assert (=> d!63777 (= res!153809 (= (bvadd lt!284380 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4320 (buf!4775 lt!284379)) (currentByte!9009 lt!284379) (currentBit!9004 lt!284379))))))

(assert (=> d!63777 (or (not (= (bvand lt!284380 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!284380 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!284380 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63777 (= lt!284380 (bitIndex!0 (size!4320 (buf!4775 (_1!8645 lt!283971))) (currentByte!9009 (_1!8645 lt!283971)) (currentBit!9004 (_1!8645 lt!283971))))))

(declare-fun moveBitIndex!0 (BitStream!7748 (_ BitVec 64)) tuple2!15996)

(assert (=> d!63777 (= lt!284379 (_2!8643 (moveBitIndex!0 (_1!8645 lt!283971) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!63777 (moveBitIndexPrecond!0 (_1!8645 lt!283971) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!63777 (= (withMovedBitIndex!0 (_1!8645 lt!283971) #b0000000000000000000000000000000000000000000000000000000000000001) lt!284379)))

(declare-fun b!184833 () Bool)

(assert (=> b!184833 (= e!128013 (= (size!4320 (buf!4775 (_1!8645 lt!283971))) (size!4320 (buf!4775 lt!284379))))))

(assert (= (and d!63777 res!153809) b!184833))

(declare-fun m!287227 () Bool)

(assert (=> d!63777 m!287227))

(declare-fun m!287229 () Bool)

(assert (=> d!63777 m!287229))

(declare-fun m!287231 () Bool)

(assert (=> d!63777 m!287231))

(declare-fun m!287233 () Bool)

(assert (=> d!63777 m!287233))

(assert (=> b!184677 d!63777))

(declare-fun d!63779 () Bool)

(assert (=> d!63779 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9004 thiss!1204) (currentByte!9009 thiss!1204) (size!4320 (buf!4775 thiss!1204))))))

(declare-fun bs!15884 () Bool)

(assert (= bs!15884 d!63779))

(assert (=> bs!15884 m!286945))

(assert (=> start!40224 d!63779))

(declare-fun d!63781 () Bool)

(assert (=> d!63781 (= (invariant!0 (currentBit!9004 thiss!1204) (currentByte!9009 thiss!1204) (size!4320 (buf!4775 thiss!1204))) (and (bvsge (currentBit!9004 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9004 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9009 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9009 thiss!1204) (size!4320 (buf!4775 thiss!1204))) (and (= (currentBit!9004 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9009 thiss!1204) (size!4320 (buf!4775 thiss!1204)))))))))

(assert (=> b!184678 d!63781))

(declare-fun d!63783 () Bool)

(declare-fun e!128016 () Bool)

(assert (=> d!63783 e!128016))

(declare-fun res!153815 () Bool)

(assert (=> d!63783 (=> (not res!153815) (not e!128016))))

(declare-fun lt!284393 () (_ BitVec 64))

(declare-fun lt!284396 () (_ BitVec 64))

(declare-fun lt!284397 () (_ BitVec 64))

(assert (=> d!63783 (= res!153815 (= lt!284393 (bvsub lt!284397 lt!284396)))))

(assert (=> d!63783 (or (= (bvand lt!284397 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!284396 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!284397 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!284397 lt!284396) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!63783 (= lt!284396 (remainingBits!0 ((_ sign_extend 32) (size!4320 (buf!4775 (_1!8644 lt!283972)))) ((_ sign_extend 32) (currentByte!9009 (_1!8644 lt!283972))) ((_ sign_extend 32) (currentBit!9004 (_1!8644 lt!283972)))))))

(declare-fun lt!284394 () (_ BitVec 64))

(declare-fun lt!284395 () (_ BitVec 64))

(assert (=> d!63783 (= lt!284397 (bvmul lt!284394 lt!284395))))

(assert (=> d!63783 (or (= lt!284394 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!284395 (bvsdiv (bvmul lt!284394 lt!284395) lt!284394)))))

(assert (=> d!63783 (= lt!284395 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63783 (= lt!284394 ((_ sign_extend 32) (size!4320 (buf!4775 (_1!8644 lt!283972)))))))

(assert (=> d!63783 (= lt!284393 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9009 (_1!8644 lt!283972))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9004 (_1!8644 lt!283972)))))))

(assert (=> d!63783 (invariant!0 (currentBit!9004 (_1!8644 lt!283972)) (currentByte!9009 (_1!8644 lt!283972)) (size!4320 (buf!4775 (_1!8644 lt!283972))))))

(assert (=> d!63783 (= (bitIndex!0 (size!4320 (buf!4775 (_1!8644 lt!283972))) (currentByte!9009 (_1!8644 lt!283972)) (currentBit!9004 (_1!8644 lt!283972))) lt!284393)))

(declare-fun b!184838 () Bool)

(declare-fun res!153814 () Bool)

(assert (=> b!184838 (=> (not res!153814) (not e!128016))))

(assert (=> b!184838 (= res!153814 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!284393))))

(declare-fun b!184839 () Bool)

(declare-fun lt!284398 () (_ BitVec 64))

(assert (=> b!184839 (= e!128016 (bvsle lt!284393 (bvmul lt!284398 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!184839 (or (= lt!284398 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!284398 #b0000000000000000000000000000000000000000000000000000000000001000) lt!284398)))))

(assert (=> b!184839 (= lt!284398 ((_ sign_extend 32) (size!4320 (buf!4775 (_1!8644 lt!283972)))))))

(assert (= (and d!63783 res!153815) b!184838))

(assert (= (and b!184838 res!153814) b!184839))

(declare-fun m!287235 () Bool)

(assert (=> d!63783 m!287235))

(declare-fun m!287237 () Bool)

(assert (=> d!63783 m!287237))

(assert (=> b!184676 d!63783))

(declare-fun d!63785 () Bool)

(assert (=> d!63785 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4320 (buf!4775 thiss!1204))) ((_ sign_extend 32) (currentByte!9009 thiss!1204)) ((_ sign_extend 32) (currentBit!9004 thiss!1204)) lt!283976) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4320 (buf!4775 thiss!1204))) ((_ sign_extend 32) (currentByte!9009 thiss!1204)) ((_ sign_extend 32) (currentBit!9004 thiss!1204))) lt!283976))))

(declare-fun bs!15885 () Bool)

(assert (= bs!15885 d!63785))

(declare-fun m!287239 () Bool)

(assert (=> bs!15885 m!287239))

(assert (=> b!184669 d!63785))

(declare-fun d!63787 () Bool)

(declare-fun res!153824 () Bool)

(declare-fun e!128021 () Bool)

(assert (=> d!63787 (=> (not res!153824) (not e!128021))))

(assert (=> d!63787 (= res!153824 (= (size!4320 (buf!4775 thiss!1204)) (size!4320 (buf!4775 (_2!8643 lt!283974)))))))

(assert (=> d!63787 (= (isPrefixOf!0 thiss!1204 (_2!8643 lt!283974)) e!128021)))

(declare-fun b!184846 () Bool)

(declare-fun res!153822 () Bool)

(assert (=> b!184846 (=> (not res!153822) (not e!128021))))

(assert (=> b!184846 (= res!153822 (bvsle (bitIndex!0 (size!4320 (buf!4775 thiss!1204)) (currentByte!9009 thiss!1204) (currentBit!9004 thiss!1204)) (bitIndex!0 (size!4320 (buf!4775 (_2!8643 lt!283974))) (currentByte!9009 (_2!8643 lt!283974)) (currentBit!9004 (_2!8643 lt!283974)))))))

(declare-fun b!184847 () Bool)

(declare-fun e!128022 () Bool)

(assert (=> b!184847 (= e!128021 e!128022)))

(declare-fun res!153823 () Bool)

(assert (=> b!184847 (=> res!153823 e!128022)))

(assert (=> b!184847 (= res!153823 (= (size!4320 (buf!4775 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!184848 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9792 array!9792 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!184848 (= e!128022 (arrayBitRangesEq!0 (buf!4775 thiss!1204) (buf!4775 (_2!8643 lt!283974)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4320 (buf!4775 thiss!1204)) (currentByte!9009 thiss!1204) (currentBit!9004 thiss!1204))))))

(assert (= (and d!63787 res!153824) b!184846))

(assert (= (and b!184846 res!153822) b!184847))

(assert (= (and b!184847 (not res!153823)) b!184848))

(assert (=> b!184846 m!286883))

(assert (=> b!184846 m!286881))

(assert (=> b!184848 m!286883))

(assert (=> b!184848 m!286883))

(declare-fun m!287241 () Bool)

(assert (=> b!184848 m!287241))

(assert (=> b!184680 d!63787))

(declare-fun d!63789 () Bool)

(assert (=> d!63789 (= (invariant!0 (currentBit!9004 (_2!8643 lt!283991)) (currentByte!9009 (_2!8643 lt!283991)) (size!4320 (buf!4775 (_2!8643 lt!283991)))) (and (bvsge (currentBit!9004 (_2!8643 lt!283991)) #b00000000000000000000000000000000) (bvslt (currentBit!9004 (_2!8643 lt!283991)) #b00000000000000000000000000001000) (bvsge (currentByte!9009 (_2!8643 lt!283991)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9009 (_2!8643 lt!283991)) (size!4320 (buf!4775 (_2!8643 lt!283991)))) (and (= (currentBit!9004 (_2!8643 lt!283991)) #b00000000000000000000000000000000) (= (currentByte!9009 (_2!8643 lt!283991)) (size!4320 (buf!4775 (_2!8643 lt!283991))))))))))

(assert (=> b!184670 d!63789))

(declare-fun d!63791 () Bool)

(declare-fun e!128023 () Bool)

(assert (=> d!63791 e!128023))

(declare-fun res!153826 () Bool)

(assert (=> d!63791 (=> (not res!153826) (not e!128023))))

(declare-fun lt!284399 () (_ BitVec 64))

(declare-fun lt!284402 () (_ BitVec 64))

(declare-fun lt!284403 () (_ BitVec 64))

(assert (=> d!63791 (= res!153826 (= lt!284399 (bvsub lt!284403 lt!284402)))))

(assert (=> d!63791 (or (= (bvand lt!284403 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!284402 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!284403 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!284403 lt!284402) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63791 (= lt!284402 (remainingBits!0 ((_ sign_extend 32) (size!4320 (buf!4775 (_2!8643 lt!283991)))) ((_ sign_extend 32) (currentByte!9009 (_2!8643 lt!283991))) ((_ sign_extend 32) (currentBit!9004 (_2!8643 lt!283991)))))))

(declare-fun lt!284400 () (_ BitVec 64))

(declare-fun lt!284401 () (_ BitVec 64))

(assert (=> d!63791 (= lt!284403 (bvmul lt!284400 lt!284401))))

(assert (=> d!63791 (or (= lt!284400 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!284401 (bvsdiv (bvmul lt!284400 lt!284401) lt!284400)))))

(assert (=> d!63791 (= lt!284401 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63791 (= lt!284400 ((_ sign_extend 32) (size!4320 (buf!4775 (_2!8643 lt!283991)))))))

(assert (=> d!63791 (= lt!284399 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9009 (_2!8643 lt!283991))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9004 (_2!8643 lt!283991)))))))

(assert (=> d!63791 (invariant!0 (currentBit!9004 (_2!8643 lt!283991)) (currentByte!9009 (_2!8643 lt!283991)) (size!4320 (buf!4775 (_2!8643 lt!283991))))))

(assert (=> d!63791 (= (bitIndex!0 (size!4320 (buf!4775 (_2!8643 lt!283991))) (currentByte!9009 (_2!8643 lt!283991)) (currentBit!9004 (_2!8643 lt!283991))) lt!284399)))

(declare-fun b!184849 () Bool)

(declare-fun res!153825 () Bool)

(assert (=> b!184849 (=> (not res!153825) (not e!128023))))

(assert (=> b!184849 (= res!153825 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!284399))))

(declare-fun b!184850 () Bool)

(declare-fun lt!284404 () (_ BitVec 64))

(assert (=> b!184850 (= e!128023 (bvsle lt!284399 (bvmul lt!284404 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!184850 (or (= lt!284404 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!284404 #b0000000000000000000000000000000000000000000000000000000000001000) lt!284404)))))

(assert (=> b!184850 (= lt!284404 ((_ sign_extend 32) (size!4320 (buf!4775 (_2!8643 lt!283991)))))))

(assert (= (and d!63791 res!153826) b!184849))

(assert (= (and b!184849 res!153825) b!184850))

(declare-fun m!287243 () Bool)

(assert (=> d!63791 m!287243))

(assert (=> d!63791 m!286907))

(assert (=> b!184679 d!63791))

(declare-fun d!63793 () Bool)

(declare-fun res!153829 () Bool)

(declare-fun e!128024 () Bool)

(assert (=> d!63793 (=> (not res!153829) (not e!128024))))

(assert (=> d!63793 (= res!153829 (= (size!4320 (buf!4775 thiss!1204)) (size!4320 (buf!4775 (_2!8643 lt!283991)))))))

(assert (=> d!63793 (= (isPrefixOf!0 thiss!1204 (_2!8643 lt!283991)) e!128024)))

(declare-fun b!184851 () Bool)

(declare-fun res!153827 () Bool)

(assert (=> b!184851 (=> (not res!153827) (not e!128024))))

(assert (=> b!184851 (= res!153827 (bvsle (bitIndex!0 (size!4320 (buf!4775 thiss!1204)) (currentByte!9009 thiss!1204) (currentBit!9004 thiss!1204)) (bitIndex!0 (size!4320 (buf!4775 (_2!8643 lt!283991))) (currentByte!9009 (_2!8643 lt!283991)) (currentBit!9004 (_2!8643 lt!283991)))))))

(declare-fun b!184852 () Bool)

(declare-fun e!128025 () Bool)

(assert (=> b!184852 (= e!128024 e!128025)))

(declare-fun res!153828 () Bool)

(assert (=> b!184852 (=> res!153828 e!128025)))

(assert (=> b!184852 (= res!153828 (= (size!4320 (buf!4775 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!184853 () Bool)

(assert (=> b!184853 (= e!128025 (arrayBitRangesEq!0 (buf!4775 thiss!1204) (buf!4775 (_2!8643 lt!283991)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4320 (buf!4775 thiss!1204)) (currentByte!9009 thiss!1204) (currentBit!9004 thiss!1204))))))

(assert (= (and d!63793 res!153829) b!184851))

(assert (= (and b!184851 res!153827) b!184852))

(assert (= (and b!184852 (not res!153828)) b!184853))

(assert (=> b!184851 m!286883))

(assert (=> b!184851 m!286947))

(assert (=> b!184853 m!286883))

(assert (=> b!184853 m!286883))

(declare-fun m!287245 () Bool)

(assert (=> b!184853 m!287245))

(assert (=> b!184679 d!63793))

(declare-fun d!63795 () Bool)

(assert (=> d!63795 (isPrefixOf!0 thiss!1204 (_2!8643 lt!283991))))

(declare-fun lt!284407 () Unit!13215)

(declare-fun choose!30 (BitStream!7748 BitStream!7748 BitStream!7748) Unit!13215)

(assert (=> d!63795 (= lt!284407 (choose!30 thiss!1204 (_2!8643 lt!283974) (_2!8643 lt!283991)))))

(assert (=> d!63795 (isPrefixOf!0 thiss!1204 (_2!8643 lt!283974))))

(assert (=> d!63795 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8643 lt!283974) (_2!8643 lt!283991)) lt!284407)))

(declare-fun bs!15886 () Bool)

(assert (= bs!15886 d!63795))

(assert (=> bs!15886 m!286949))

(declare-fun m!287247 () Bool)

(assert (=> bs!15886 m!287247))

(assert (=> bs!15886 m!286891))

(assert (=> b!184679 d!63795))

(declare-fun b!184996 () Bool)

(declare-fun res!153951 () Bool)

(declare-fun lt!284940 () tuple2!15996)

(assert (=> b!184996 (= res!153951 (isPrefixOf!0 (_2!8643 lt!283974) (_2!8643 lt!284940)))))

(declare-fun e!128112 () Bool)

(assert (=> b!184996 (=> (not res!153951) (not e!128112))))

(declare-fun b!184997 () Bool)

(declare-fun e!128117 () tuple2!15996)

(declare-fun Unit!13243 () Unit!13215)

(assert (=> b!184997 (= e!128117 (tuple2!15997 Unit!13243 (_2!8643 lt!283974)))))

(declare-fun lt!284932 () Unit!13215)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7748) Unit!13215)

(assert (=> b!184997 (= lt!284932 (lemmaIsPrefixRefl!0 (_2!8643 lt!283974)))))

(declare-fun call!2981 () Bool)

(assert (=> b!184997 call!2981))

(declare-fun lt!284922 () Unit!13215)

(assert (=> b!184997 (= lt!284922 lt!284932)))

(declare-fun b!184998 () Bool)

(declare-fun res!153944 () Bool)

(assert (=> b!184998 (= res!153944 (= (bitIndex!0 (size!4320 (buf!4775 (_2!8643 lt!284940))) (currentByte!9009 (_2!8643 lt!284940)) (currentBit!9004 (_2!8643 lt!284940))) (bvadd (bitIndex!0 (size!4320 (buf!4775 (_2!8643 lt!283974))) (currentByte!9009 (_2!8643 lt!283974)) (currentBit!9004 (_2!8643 lt!283974))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!184998 (=> (not res!153944) (not e!128112))))

(declare-fun b!184999 () Bool)

(declare-fun e!128114 () Bool)

(declare-fun lt!284916 () tuple2!16002)

(declare-fun lt!284929 () tuple2!16000)

(assert (=> b!184999 (= e!128114 (= (_1!8646 lt!284916) (_2!8645 lt!284929)))))

(declare-fun b!185000 () Bool)

(declare-fun e!128116 () Bool)

(declare-fun lt!284941 () tuple2!15998)

(declare-fun lt!284950 () tuple2!15998)

(assert (=> b!185000 (= e!128116 (= (_2!8644 lt!284941) (_2!8644 lt!284950)))))

(declare-fun b!185001 () Bool)

(declare-fun lt!284939 () tuple2!15996)

(assert (=> b!185001 (= e!128117 (tuple2!15997 (_1!8643 lt!284939) (_2!8643 lt!284939)))))

(declare-fun lt!284923 () Bool)

(assert (=> b!185001 (= lt!284923 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!185001 (= lt!284940 (appendBit!0 (_2!8643 lt!283974) lt!284923))))

(declare-fun res!153941 () Bool)

(assert (=> b!185001 (= res!153941 (= (size!4320 (buf!4775 (_2!8643 lt!283974))) (size!4320 (buf!4775 (_2!8643 lt!284940)))))))

(assert (=> b!185001 (=> (not res!153941) (not e!128112))))

(assert (=> b!185001 e!128112))

(declare-fun lt!284909 () tuple2!15996)

(assert (=> b!185001 (= lt!284909 lt!284940)))

(assert (=> b!185001 (= lt!284939 (appendBitsLSBFirstLoopTR!0 (_2!8643 lt!284909) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!284904 () Unit!13215)

(assert (=> b!185001 (= lt!284904 (lemmaIsPrefixTransitive!0 (_2!8643 lt!283974) (_2!8643 lt!284909) (_2!8643 lt!284939)))))

(assert (=> b!185001 call!2981))

(declare-fun lt!284912 () Unit!13215)

(assert (=> b!185001 (= lt!284912 lt!284904)))

(assert (=> b!185001 (invariant!0 (currentBit!9004 (_2!8643 lt!283974)) (currentByte!9009 (_2!8643 lt!283974)) (size!4320 (buf!4775 (_2!8643 lt!284909))))))

(declare-fun lt!284948 () BitStream!7748)

(assert (=> b!185001 (= lt!284948 (BitStream!7749 (buf!4775 (_2!8643 lt!284909)) (currentByte!9009 (_2!8643 lt!283974)) (currentBit!9004 (_2!8643 lt!283974))))))

(assert (=> b!185001 (invariant!0 (currentBit!9004 lt!284948) (currentByte!9009 lt!284948) (size!4320 (buf!4775 (_2!8643 lt!284939))))))

(declare-fun lt!284949 () BitStream!7748)

(assert (=> b!185001 (= lt!284949 (BitStream!7749 (buf!4775 (_2!8643 lt!284939)) (currentByte!9009 lt!284948) (currentBit!9004 lt!284948)))))

(assert (=> b!185001 (= lt!284941 (readBitPure!0 lt!284948))))

(assert (=> b!185001 (= lt!284950 (readBitPure!0 lt!284949))))

(declare-fun lt!284952 () Unit!13215)

(assert (=> b!185001 (= lt!284952 (readBitPrefixLemma!0 lt!284948 (_2!8643 lt!284939)))))

(declare-fun res!153947 () Bool)

(assert (=> b!185001 (= res!153947 (= (bitIndex!0 (size!4320 (buf!4775 (_1!8644 lt!284941))) (currentByte!9009 (_1!8644 lt!284941)) (currentBit!9004 (_1!8644 lt!284941))) (bitIndex!0 (size!4320 (buf!4775 (_1!8644 lt!284950))) (currentByte!9009 (_1!8644 lt!284950)) (currentBit!9004 (_1!8644 lt!284950)))))))

(assert (=> b!185001 (=> (not res!153947) (not e!128116))))

(assert (=> b!185001 e!128116))

(declare-fun lt!284942 () Unit!13215)

(assert (=> b!185001 (= lt!284942 lt!284952)))

(declare-fun lt!284900 () tuple2!16000)

(assert (=> b!185001 (= lt!284900 (reader!0 (_2!8643 lt!283974) (_2!8643 lt!284939)))))

(declare-fun lt!284933 () tuple2!16000)

(assert (=> b!185001 (= lt!284933 (reader!0 (_2!8643 lt!284909) (_2!8643 lt!284939)))))

(declare-fun lt!284943 () tuple2!15998)

(assert (=> b!185001 (= lt!284943 (readBitPure!0 (_1!8645 lt!284900)))))

(assert (=> b!185001 (= (_2!8644 lt!284943) lt!284923)))

(declare-fun lt!284911 () Unit!13215)

(declare-fun Unit!13244 () Unit!13215)

(assert (=> b!185001 (= lt!284911 Unit!13244)))

(declare-fun lt!284908 () (_ BitVec 64))

(assert (=> b!185001 (= lt!284908 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!284935 () (_ BitVec 64))

(assert (=> b!185001 (= lt!284935 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!284897 () Unit!13215)

(assert (=> b!185001 (= lt!284897 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8643 lt!283974) (buf!4775 (_2!8643 lt!284939)) lt!284935))))

(assert (=> b!185001 (validate_offset_bits!1 ((_ sign_extend 32) (size!4320 (buf!4775 (_2!8643 lt!284939)))) ((_ sign_extend 32) (currentByte!9009 (_2!8643 lt!283974))) ((_ sign_extend 32) (currentBit!9004 (_2!8643 lt!283974))) lt!284935)))

(declare-fun lt!284918 () Unit!13215)

(assert (=> b!185001 (= lt!284918 lt!284897)))

(declare-fun lt!284899 () tuple2!16002)

(assert (=> b!185001 (= lt!284899 (readNBitsLSBFirstsLoopPure!0 (_1!8645 lt!284900) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!284908))))

(declare-fun lt!284928 () (_ BitVec 64))

(assert (=> b!185001 (= lt!284928 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!284917 () Unit!13215)

(assert (=> b!185001 (= lt!284917 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8643 lt!284909) (buf!4775 (_2!8643 lt!284939)) lt!284928))))

(assert (=> b!185001 (validate_offset_bits!1 ((_ sign_extend 32) (size!4320 (buf!4775 (_2!8643 lt!284939)))) ((_ sign_extend 32) (currentByte!9009 (_2!8643 lt!284909))) ((_ sign_extend 32) (currentBit!9004 (_2!8643 lt!284909))) lt!284928)))

(declare-fun lt!284938 () Unit!13215)

(assert (=> b!185001 (= lt!284938 lt!284917)))

(declare-fun lt!284936 () tuple2!16002)

(assert (=> b!185001 (= lt!284936 (readNBitsLSBFirstsLoopPure!0 (_1!8645 lt!284933) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!284908 (ite (_2!8644 lt!284943) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!284920 () tuple2!16002)

(assert (=> b!185001 (= lt!284920 (readNBitsLSBFirstsLoopPure!0 (_1!8645 lt!284900) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!284908))))

(declare-fun c!9452 () Bool)

(assert (=> b!185001 (= c!9452 (_2!8644 (readBitPure!0 (_1!8645 lt!284900))))))

(declare-fun e!128109 () (_ BitVec 64))

(declare-fun lt!284906 () tuple2!16002)

(assert (=> b!185001 (= lt!284906 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8645 lt!284900) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!284908 e!128109)))))

(declare-fun lt!284921 () Unit!13215)

(assert (=> b!185001 (= lt!284921 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8645 lt!284900) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!284908))))

(assert (=> b!185001 (and (= (_2!8646 lt!284920) (_2!8646 lt!284906)) (= (_1!8646 lt!284920) (_1!8646 lt!284906)))))

(declare-fun lt!284915 () Unit!13215)

(assert (=> b!185001 (= lt!284915 lt!284921)))

(assert (=> b!185001 (= (_1!8645 lt!284900) (withMovedBitIndex!0 (_2!8645 lt!284900) (bvsub (bitIndex!0 (size!4320 (buf!4775 (_2!8643 lt!283974))) (currentByte!9009 (_2!8643 lt!283974)) (currentBit!9004 (_2!8643 lt!283974))) (bitIndex!0 (size!4320 (buf!4775 (_2!8643 lt!284939))) (currentByte!9009 (_2!8643 lt!284939)) (currentBit!9004 (_2!8643 lt!284939))))))))

(declare-fun lt!284910 () Unit!13215)

(declare-fun Unit!13245 () Unit!13215)

(assert (=> b!185001 (= lt!284910 Unit!13245)))

(assert (=> b!185001 (= (_1!8645 lt!284933) (withMovedBitIndex!0 (_2!8645 lt!284933) (bvsub (bitIndex!0 (size!4320 (buf!4775 (_2!8643 lt!284909))) (currentByte!9009 (_2!8643 lt!284909)) (currentBit!9004 (_2!8643 lt!284909))) (bitIndex!0 (size!4320 (buf!4775 (_2!8643 lt!284939))) (currentByte!9009 (_2!8643 lt!284939)) (currentBit!9004 (_2!8643 lt!284939))))))))

(declare-fun lt!284934 () Unit!13215)

(declare-fun Unit!13246 () Unit!13215)

(assert (=> b!185001 (= lt!284934 Unit!13246)))

(assert (=> b!185001 (= (bitIndex!0 (size!4320 (buf!4775 (_2!8643 lt!283974))) (currentByte!9009 (_2!8643 lt!283974)) (currentBit!9004 (_2!8643 lt!283974))) (bvsub (bitIndex!0 (size!4320 (buf!4775 (_2!8643 lt!284909))) (currentByte!9009 (_2!8643 lt!284909)) (currentBit!9004 (_2!8643 lt!284909))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!284927 () Unit!13215)

(declare-fun Unit!13247 () Unit!13215)

(assert (=> b!185001 (= lt!284927 Unit!13247)))

(assert (=> b!185001 (= (_2!8646 lt!284899) (_2!8646 lt!284936))))

(declare-fun lt!284903 () Unit!13215)

(declare-fun Unit!13248 () Unit!13215)

(assert (=> b!185001 (= lt!284903 Unit!13248)))

(assert (=> b!185001 (invariant!0 (currentBit!9004 (_2!8643 lt!284939)) (currentByte!9009 (_2!8643 lt!284939)) (size!4320 (buf!4775 (_2!8643 lt!284939))))))

(declare-fun lt!284930 () Unit!13215)

(declare-fun Unit!13249 () Unit!13215)

(assert (=> b!185001 (= lt!284930 Unit!13249)))

(assert (=> b!185001 (= (size!4320 (buf!4775 (_2!8643 lt!283974))) (size!4320 (buf!4775 (_2!8643 lt!284939))))))

(declare-fun lt!284919 () Unit!13215)

(declare-fun Unit!13250 () Unit!13215)

(assert (=> b!185001 (= lt!284919 Unit!13250)))

(assert (=> b!185001 (= (bitIndex!0 (size!4320 (buf!4775 (_2!8643 lt!284939))) (currentByte!9009 (_2!8643 lt!284939)) (currentBit!9004 (_2!8643 lt!284939))) (bvsub (bvadd (bitIndex!0 (size!4320 (buf!4775 (_2!8643 lt!283974))) (currentByte!9009 (_2!8643 lt!283974)) (currentBit!9004 (_2!8643 lt!283974))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!284925 () Unit!13215)

(declare-fun Unit!13251 () Unit!13215)

(assert (=> b!185001 (= lt!284925 Unit!13251)))

(declare-fun lt!284914 () Unit!13215)

(declare-fun Unit!13252 () Unit!13215)

(assert (=> b!185001 (= lt!284914 Unit!13252)))

(declare-fun lt!284946 () tuple2!16000)

(assert (=> b!185001 (= lt!284946 (reader!0 (_2!8643 lt!283974) (_2!8643 lt!284939)))))

(declare-fun lt!284947 () (_ BitVec 64))

(assert (=> b!185001 (= lt!284947 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!284926 () Unit!13215)

(assert (=> b!185001 (= lt!284926 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8643 lt!283974) (buf!4775 (_2!8643 lt!284939)) lt!284947))))

(assert (=> b!185001 (validate_offset_bits!1 ((_ sign_extend 32) (size!4320 (buf!4775 (_2!8643 lt!284939)))) ((_ sign_extend 32) (currentByte!9009 (_2!8643 lt!283974))) ((_ sign_extend 32) (currentBit!9004 (_2!8643 lt!283974))) lt!284947)))

(declare-fun lt!284951 () Unit!13215)

(assert (=> b!185001 (= lt!284951 lt!284926)))

(declare-fun lt!284937 () tuple2!16002)

(assert (=> b!185001 (= lt!284937 (readNBitsLSBFirstsLoopPure!0 (_1!8645 lt!284946) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!153943 () Bool)

(assert (=> b!185001 (= res!153943 (= (_2!8646 lt!284937) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!128115 () Bool)

(assert (=> b!185001 (=> (not res!153943) (not e!128115))))

(assert (=> b!185001 e!128115))

(declare-fun lt!284902 () Unit!13215)

(declare-fun Unit!13253 () Unit!13215)

(assert (=> b!185001 (= lt!284902 Unit!13253)))

(declare-fun c!9451 () Bool)

(declare-fun bm!2978 () Bool)

(assert (=> bm!2978 (= call!2981 (isPrefixOf!0 (_2!8643 lt!283974) (ite c!9451 (_2!8643 lt!283974) (_2!8643 lt!284939))))))

(declare-fun b!185003 () Bool)

(assert (=> b!185003 (= e!128109 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!185004 () Bool)

(declare-fun e!128111 () Bool)

(declare-fun lt!284913 () (_ BitVec 64))

(assert (=> b!185004 (= e!128111 (validate_offset_bits!1 ((_ sign_extend 32) (size!4320 (buf!4775 (_2!8643 lt!283974)))) ((_ sign_extend 32) (currentByte!9009 (_2!8643 lt!283974))) ((_ sign_extend 32) (currentBit!9004 (_2!8643 lt!283974))) lt!284913))))

(declare-fun b!185005 () Bool)

(assert (=> b!185005 (= e!128109 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!185006 () Bool)

(declare-fun res!153949 () Bool)

(declare-fun e!128110 () Bool)

(assert (=> b!185006 (=> (not res!153949) (not e!128110))))

(declare-fun lt!284924 () tuple2!15996)

(declare-fun lt!284931 () (_ BitVec 64))

(declare-fun lt!284907 () (_ BitVec 64))

(assert (=> b!185006 (= res!153949 (= (bitIndex!0 (size!4320 (buf!4775 (_2!8643 lt!284924))) (currentByte!9009 (_2!8643 lt!284924)) (currentBit!9004 (_2!8643 lt!284924))) (bvsub lt!284907 lt!284931)))))

(assert (=> b!185006 (or (= (bvand lt!284907 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!284931 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!284907 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!284907 lt!284931) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!185006 (= lt!284931 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!284944 () (_ BitVec 64))

(declare-fun lt!284905 () (_ BitVec 64))

(assert (=> b!185006 (= lt!284907 (bvadd lt!284944 lt!284905))))

(assert (=> b!185006 (or (not (= (bvand lt!284944 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!284905 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!284944 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!284944 lt!284905) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!185006 (= lt!284905 ((_ sign_extend 32) nBits!348))))

(assert (=> b!185006 (= lt!284944 (bitIndex!0 (size!4320 (buf!4775 (_2!8643 lt!283974))) (currentByte!9009 (_2!8643 lt!283974)) (currentBit!9004 (_2!8643 lt!283974))))))

(declare-fun b!185007 () Bool)

(assert (=> b!185007 (= e!128110 e!128114)))

(declare-fun res!153946 () Bool)

(assert (=> b!185007 (=> (not res!153946) (not e!128114))))

(assert (=> b!185007 (= res!153946 (= (_2!8646 lt!284916) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!185007 (= lt!284916 (readNBitsLSBFirstsLoopPure!0 (_1!8645 lt!284929) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!284901 () Unit!13215)

(declare-fun lt!284898 () Unit!13215)

(assert (=> b!185007 (= lt!284901 lt!284898)))

(assert (=> b!185007 (validate_offset_bits!1 ((_ sign_extend 32) (size!4320 (buf!4775 (_2!8643 lt!284924)))) ((_ sign_extend 32) (currentByte!9009 (_2!8643 lt!283974))) ((_ sign_extend 32) (currentBit!9004 (_2!8643 lt!283974))) lt!284913)))

(assert (=> b!185007 (= lt!284898 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8643 lt!283974) (buf!4775 (_2!8643 lt!284924)) lt!284913))))

(assert (=> b!185007 e!128111))

(declare-fun res!153940 () Bool)

(assert (=> b!185007 (=> (not res!153940) (not e!128111))))

(assert (=> b!185007 (= res!153940 (and (= (size!4320 (buf!4775 (_2!8643 lt!283974))) (size!4320 (buf!4775 (_2!8643 lt!284924)))) (bvsge lt!284913 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!185007 (= lt!284913 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!185007 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!185007 (= lt!284929 (reader!0 (_2!8643 lt!283974) (_2!8643 lt!284924)))))

(declare-fun b!185008 () Bool)

(declare-fun res!153948 () Bool)

(assert (=> b!185008 (=> (not res!153948) (not e!128110))))

(assert (=> b!185008 (= res!153948 (isPrefixOf!0 (_2!8643 lt!283974) (_2!8643 lt!284924)))))

(declare-fun b!185009 () Bool)

(assert (=> b!185009 (= e!128115 (= (_1!8646 lt!284937) (_2!8645 lt!284946)))))

(declare-fun b!185010 () Bool)

(declare-fun res!153942 () Bool)

(assert (=> b!185010 (=> (not res!153942) (not e!128110))))

(assert (=> b!185010 (= res!153942 (= (size!4320 (buf!4775 (_2!8643 lt!283974))) (size!4320 (buf!4775 (_2!8643 lt!284924)))))))

(declare-fun b!185011 () Bool)

(declare-fun lt!284945 () tuple2!15998)

(assert (=> b!185011 (= lt!284945 (readBitPure!0 (readerFrom!0 (_2!8643 lt!284940) (currentBit!9004 (_2!8643 lt!283974)) (currentByte!9009 (_2!8643 lt!283974)))))))

(declare-fun res!153950 () Bool)

(assert (=> b!185011 (= res!153950 (and (= (_2!8644 lt!284945) lt!284923) (= (_1!8644 lt!284945) (_2!8643 lt!284940))))))

(declare-fun e!128113 () Bool)

(assert (=> b!185011 (=> (not res!153950) (not e!128113))))

(assert (=> b!185011 (= e!128112 e!128113)))

(declare-fun d!63797 () Bool)

(assert (=> d!63797 e!128110))

(declare-fun res!153945 () Bool)

(assert (=> d!63797 (=> (not res!153945) (not e!128110))))

(assert (=> d!63797 (= res!153945 (invariant!0 (currentBit!9004 (_2!8643 lt!284924)) (currentByte!9009 (_2!8643 lt!284924)) (size!4320 (buf!4775 (_2!8643 lt!284924)))))))

(assert (=> d!63797 (= lt!284924 e!128117)))

(assert (=> d!63797 (= c!9451 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!63797 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!63797 (= (appendBitsLSBFirstLoopTR!0 (_2!8643 lt!283974) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!284924)))

(declare-fun b!185002 () Bool)

(assert (=> b!185002 (= e!128113 (= (bitIndex!0 (size!4320 (buf!4775 (_1!8644 lt!284945))) (currentByte!9009 (_1!8644 lt!284945)) (currentBit!9004 (_1!8644 lt!284945))) (bitIndex!0 (size!4320 (buf!4775 (_2!8643 lt!284940))) (currentByte!9009 (_2!8643 lt!284940)) (currentBit!9004 (_2!8643 lt!284940)))))))

(assert (= (and d!63797 c!9451) b!184997))

(assert (= (and d!63797 (not c!9451)) b!185001))

(assert (= (and b!185001 res!153941) b!184998))

(assert (= (and b!184998 res!153944) b!184996))

(assert (= (and b!184996 res!153951) b!185011))

(assert (= (and b!185011 res!153950) b!185002))

(assert (= (and b!185001 res!153947) b!185000))

(assert (= (and b!185001 c!9452) b!185003))

(assert (= (and b!185001 (not c!9452)) b!185005))

(assert (= (and b!185001 res!153943) b!185009))

(assert (= (or b!184997 b!185001) bm!2978))

(assert (= (and d!63797 res!153945) b!185010))

(assert (= (and b!185010 res!153942) b!185006))

(assert (= (and b!185006 res!153949) b!185008))

(assert (= (and b!185008 res!153948) b!185007))

(assert (= (and b!185007 res!153940) b!185004))

(assert (= (and b!185007 res!153946) b!184999))

(declare-fun m!287459 () Bool)

(assert (=> bm!2978 m!287459))

(declare-fun m!287461 () Bool)

(assert (=> b!184997 m!287461))

(declare-fun m!287463 () Bool)

(assert (=> d!63797 m!287463))

(declare-fun m!287465 () Bool)

(assert (=> b!185001 m!287465))

(declare-fun m!287467 () Bool)

(assert (=> b!185001 m!287467))

(declare-fun m!287469 () Bool)

(assert (=> b!185001 m!287469))

(declare-fun m!287471 () Bool)

(assert (=> b!185001 m!287471))

(declare-fun m!287473 () Bool)

(assert (=> b!185001 m!287473))

(declare-fun m!287475 () Bool)

(assert (=> b!185001 m!287475))

(declare-fun m!287477 () Bool)

(assert (=> b!185001 m!287477))

(declare-fun m!287479 () Bool)

(assert (=> b!185001 m!287479))

(declare-fun m!287481 () Bool)

(assert (=> b!185001 m!287481))

(declare-fun m!287483 () Bool)

(assert (=> b!185001 m!287483))

(declare-fun m!287485 () Bool)

(assert (=> b!185001 m!287485))

(declare-fun m!287487 () Bool)

(assert (=> b!185001 m!287487))

(declare-fun m!287489 () Bool)

(assert (=> b!185001 m!287489))

(declare-fun m!287491 () Bool)

(assert (=> b!185001 m!287491))

(declare-fun m!287493 () Bool)

(assert (=> b!185001 m!287493))

(declare-fun m!287495 () Bool)

(assert (=> b!185001 m!287495))

(declare-fun m!287497 () Bool)

(assert (=> b!185001 m!287497))

(declare-fun m!287499 () Bool)

(assert (=> b!185001 m!287499))

(declare-fun m!287501 () Bool)

(assert (=> b!185001 m!287501))

(declare-fun m!287503 () Bool)

(assert (=> b!185001 m!287503))

(declare-fun m!287505 () Bool)

(assert (=> b!185001 m!287505))

(declare-fun m!287507 () Bool)

(assert (=> b!185001 m!287507))

(assert (=> b!185001 m!286881))

(declare-fun m!287509 () Bool)

(assert (=> b!185001 m!287509))

(declare-fun m!287511 () Bool)

(assert (=> b!185001 m!287511))

(declare-fun m!287513 () Bool)

(assert (=> b!185001 m!287513))

(declare-fun m!287515 () Bool)

(assert (=> b!185001 m!287515))

(assert (=> b!185001 m!287505))

(declare-fun m!287517 () Bool)

(assert (=> b!185001 m!287517))

(declare-fun m!287519 () Bool)

(assert (=> b!185001 m!287519))

(declare-fun m!287521 () Bool)

(assert (=> b!185001 m!287521))

(declare-fun m!287523 () Bool)

(assert (=> b!185001 m!287523))

(declare-fun m!287525 () Bool)

(assert (=> b!185001 m!287525))

(declare-fun m!287527 () Bool)

(assert (=> b!185001 m!287527))

(declare-fun m!287529 () Bool)

(assert (=> b!185008 m!287529))

(declare-fun m!287531 () Bool)

(assert (=> b!185011 m!287531))

(assert (=> b!185011 m!287531))

(declare-fun m!287533 () Bool)

(assert (=> b!185011 m!287533))

(declare-fun m!287535 () Bool)

(assert (=> b!185002 m!287535))

(declare-fun m!287537 () Bool)

(assert (=> b!185002 m!287537))

(declare-fun m!287539 () Bool)

(assert (=> b!185007 m!287539))

(declare-fun m!287541 () Bool)

(assert (=> b!185007 m!287541))

(declare-fun m!287543 () Bool)

(assert (=> b!185007 m!287543))

(assert (=> b!185007 m!287495))

(assert (=> b!185007 m!287477))

(declare-fun m!287545 () Bool)

(assert (=> b!185007 m!287545))

(declare-fun m!287547 () Bool)

(assert (=> b!185004 m!287547))

(assert (=> b!184998 m!287537))

(assert (=> b!184998 m!286881))

(declare-fun m!287549 () Bool)

(assert (=> b!185006 m!287549))

(assert (=> b!185006 m!286881))

(declare-fun m!287551 () Bool)

(assert (=> b!184996 m!287551))

(assert (=> b!184679 d!63797))

(declare-fun d!63815 () Bool)

(declare-fun e!128118 () Bool)

(assert (=> d!63815 e!128118))

(declare-fun res!153953 () Bool)

(assert (=> d!63815 (=> (not res!153953) (not e!128118))))

(declare-fun lt!284953 () (_ BitVec 64))

(declare-fun lt!284956 () (_ BitVec 64))

(declare-fun lt!284957 () (_ BitVec 64))

(assert (=> d!63815 (= res!153953 (= lt!284953 (bvsub lt!284957 lt!284956)))))

(assert (=> d!63815 (or (= (bvand lt!284957 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!284956 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!284957 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!284957 lt!284956) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63815 (= lt!284956 (remainingBits!0 ((_ sign_extend 32) (size!4320 (buf!4775 (_2!8643 lt!283974)))) ((_ sign_extend 32) (currentByte!9009 (_2!8643 lt!283974))) ((_ sign_extend 32) (currentBit!9004 (_2!8643 lt!283974)))))))

(declare-fun lt!284954 () (_ BitVec 64))

(declare-fun lt!284955 () (_ BitVec 64))

(assert (=> d!63815 (= lt!284957 (bvmul lt!284954 lt!284955))))

(assert (=> d!63815 (or (= lt!284954 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!284955 (bvsdiv (bvmul lt!284954 lt!284955) lt!284954)))))

(assert (=> d!63815 (= lt!284955 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63815 (= lt!284954 ((_ sign_extend 32) (size!4320 (buf!4775 (_2!8643 lt!283974)))))))

(assert (=> d!63815 (= lt!284953 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9009 (_2!8643 lt!283974))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9004 (_2!8643 lt!283974)))))))

(assert (=> d!63815 (invariant!0 (currentBit!9004 (_2!8643 lt!283974)) (currentByte!9009 (_2!8643 lt!283974)) (size!4320 (buf!4775 (_2!8643 lt!283974))))))

(assert (=> d!63815 (= (bitIndex!0 (size!4320 (buf!4775 (_2!8643 lt!283974))) (currentByte!9009 (_2!8643 lt!283974)) (currentBit!9004 (_2!8643 lt!283974))) lt!284953)))

(declare-fun b!185012 () Bool)

(declare-fun res!153952 () Bool)

(assert (=> b!185012 (=> (not res!153952) (not e!128118))))

(assert (=> b!185012 (= res!153952 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!284953))))

(declare-fun b!185013 () Bool)

(declare-fun lt!284958 () (_ BitVec 64))

(assert (=> b!185013 (= e!128118 (bvsle lt!284953 (bvmul lt!284958 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!185013 (or (= lt!284958 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!284958 #b0000000000000000000000000000000000000000000000000000000000001000) lt!284958)))))

(assert (=> b!185013 (= lt!284958 ((_ sign_extend 32) (size!4320 (buf!4775 (_2!8643 lt!283974)))))))

(assert (= (and d!63815 res!153953) b!185012))

(assert (= (and b!185012 res!153952) b!185013))

(declare-fun m!287553 () Bool)

(assert (=> d!63815 m!287553))

(declare-fun m!287555 () Bool)

(assert (=> d!63815 m!287555))

(assert (=> b!184672 d!63815))

(declare-fun d!63817 () Bool)

(declare-fun e!128119 () Bool)

(assert (=> d!63817 e!128119))

(declare-fun res!153955 () Bool)

(assert (=> d!63817 (=> (not res!153955) (not e!128119))))

(declare-fun lt!284959 () (_ BitVec 64))

(declare-fun lt!284962 () (_ BitVec 64))

(declare-fun lt!284963 () (_ BitVec 64))

(assert (=> d!63817 (= res!153955 (= lt!284959 (bvsub lt!284963 lt!284962)))))

(assert (=> d!63817 (or (= (bvand lt!284963 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!284962 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!284963 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!284963 lt!284962) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63817 (= lt!284962 (remainingBits!0 ((_ sign_extend 32) (size!4320 (buf!4775 thiss!1204))) ((_ sign_extend 32) (currentByte!9009 thiss!1204)) ((_ sign_extend 32) (currentBit!9004 thiss!1204))))))

(declare-fun lt!284960 () (_ BitVec 64))

(declare-fun lt!284961 () (_ BitVec 64))

(assert (=> d!63817 (= lt!284963 (bvmul lt!284960 lt!284961))))

(assert (=> d!63817 (or (= lt!284960 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!284961 (bvsdiv (bvmul lt!284960 lt!284961) lt!284960)))))

(assert (=> d!63817 (= lt!284961 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63817 (= lt!284960 ((_ sign_extend 32) (size!4320 (buf!4775 thiss!1204))))))

(assert (=> d!63817 (= lt!284959 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9009 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9004 thiss!1204))))))

(assert (=> d!63817 (invariant!0 (currentBit!9004 thiss!1204) (currentByte!9009 thiss!1204) (size!4320 (buf!4775 thiss!1204)))))

(assert (=> d!63817 (= (bitIndex!0 (size!4320 (buf!4775 thiss!1204)) (currentByte!9009 thiss!1204) (currentBit!9004 thiss!1204)) lt!284959)))

(declare-fun b!185014 () Bool)

(declare-fun res!153954 () Bool)

(assert (=> b!185014 (=> (not res!153954) (not e!128119))))

(assert (=> b!185014 (= res!153954 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!284959))))

(declare-fun b!185015 () Bool)

(declare-fun lt!284964 () (_ BitVec 64))

(assert (=> b!185015 (= e!128119 (bvsle lt!284959 (bvmul lt!284964 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!185015 (or (= lt!284964 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!284964 #b0000000000000000000000000000000000000000000000000000000000001000) lt!284964)))))

(assert (=> b!185015 (= lt!284964 ((_ sign_extend 32) (size!4320 (buf!4775 thiss!1204))))))

(assert (= (and d!63817 res!153955) b!185014))

(assert (= (and b!185014 res!153954) b!185015))

(assert (=> d!63817 m!287239))

(assert (=> d!63817 m!286945))

(assert (=> b!184672 d!63817))

(declare-fun d!63819 () Bool)

(assert (=> d!63819 (= (array_inv!4061 (buf!4775 thiss!1204)) (bvsge (size!4320 (buf!4775 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!184683 d!63819))

(declare-fun d!63821 () Bool)

(declare-datatypes ((tuple2!16014 0))(
  ( (tuple2!16015 (_1!8652 Bool) (_2!8652 BitStream!7748)) )
))
(declare-fun lt!284967 () tuple2!16014)

(declare-fun readBit!0 (BitStream!7748) tuple2!16014)

(assert (=> d!63821 (= lt!284967 (readBit!0 lt!283986))))

(assert (=> d!63821 (= (readBitPure!0 lt!283986) (tuple2!15999 (_2!8652 lt!284967) (_1!8652 lt!284967)))))

(declare-fun bs!15891 () Bool)

(assert (= bs!15891 d!63821))

(declare-fun m!287557 () Bool)

(assert (=> bs!15891 m!287557))

(assert (=> b!184681 d!63821))

(declare-fun d!63823 () Bool)

(declare-fun lt!284968 () tuple2!16014)

(assert (=> d!63823 (= lt!284968 (readBit!0 (_1!8645 lt!283971)))))

(assert (=> d!63823 (= (readBitPure!0 (_1!8645 lt!283971)) (tuple2!15999 (_2!8652 lt!284968) (_1!8652 lt!284968)))))

(declare-fun bs!15892 () Bool)

(assert (= bs!15892 d!63823))

(declare-fun m!287559 () Bool)

(assert (=> bs!15892 m!287559))

(assert (=> b!184681 d!63823))

(declare-fun d!63825 () Bool)

(declare-fun e!128122 () Bool)

(assert (=> d!63825 e!128122))

(declare-fun res!153958 () Bool)

(assert (=> d!63825 (=> (not res!153958) (not e!128122))))

(declare-fun lt!284978 () tuple2!15998)

(declare-fun lt!284977 () tuple2!15998)

(assert (=> d!63825 (= res!153958 (= (bitIndex!0 (size!4320 (buf!4775 (_1!8644 lt!284978))) (currentByte!9009 (_1!8644 lt!284978)) (currentBit!9004 (_1!8644 lt!284978))) (bitIndex!0 (size!4320 (buf!4775 (_1!8644 lt!284977))) (currentByte!9009 (_1!8644 lt!284977)) (currentBit!9004 (_1!8644 lt!284977)))))))

(declare-fun lt!284979 () BitStream!7748)

(declare-fun lt!284980 () Unit!13215)

(declare-fun choose!50 (BitStream!7748 BitStream!7748 BitStream!7748 tuple2!15998 tuple2!15998 BitStream!7748 Bool tuple2!15998 tuple2!15998 BitStream!7748 Bool) Unit!13215)

(assert (=> d!63825 (= lt!284980 (choose!50 lt!283986 (_2!8643 lt!283991) lt!284979 lt!284978 (tuple2!15999 (_1!8644 lt!284978) (_2!8644 lt!284978)) (_1!8644 lt!284978) (_2!8644 lt!284978) lt!284977 (tuple2!15999 (_1!8644 lt!284977) (_2!8644 lt!284977)) (_1!8644 lt!284977) (_2!8644 lt!284977)))))

(assert (=> d!63825 (= lt!284977 (readBitPure!0 lt!284979))))

(assert (=> d!63825 (= lt!284978 (readBitPure!0 lt!283986))))

(assert (=> d!63825 (= lt!284979 (BitStream!7749 (buf!4775 (_2!8643 lt!283991)) (currentByte!9009 lt!283986) (currentBit!9004 lt!283986)))))

(assert (=> d!63825 (invariant!0 (currentBit!9004 lt!283986) (currentByte!9009 lt!283986) (size!4320 (buf!4775 (_2!8643 lt!283991))))))

(assert (=> d!63825 (= (readBitPrefixLemma!0 lt!283986 (_2!8643 lt!283991)) lt!284980)))

(declare-fun b!185018 () Bool)

(assert (=> b!185018 (= e!128122 (= (_2!8644 lt!284978) (_2!8644 lt!284977)))))

(assert (= (and d!63825 res!153958) b!185018))

(declare-fun m!287561 () Bool)

(assert (=> d!63825 m!287561))

(assert (=> d!63825 m!286941))

(declare-fun m!287563 () Bool)

(assert (=> d!63825 m!287563))

(declare-fun m!287565 () Bool)

(assert (=> d!63825 m!287565))

(declare-fun m!287567 () Bool)

(assert (=> d!63825 m!287567))

(declare-fun m!287569 () Bool)

(assert (=> d!63825 m!287569))

(assert (=> b!184681 d!63825))

(declare-fun lt!284981 () tuple2!16012)

(declare-fun d!63827 () Bool)

(assert (=> d!63827 (= lt!284981 (readNBitsLSBFirstsLoop!0 (_1!8645 lt!283982) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!283987))))

(assert (=> d!63827 (= (readNBitsLSBFirstsLoopPure!0 (_1!8645 lt!283982) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!283987) (tuple2!16003 (_2!8651 lt!284981) (_1!8651 lt!284981)))))

(declare-fun bs!15893 () Bool)

(assert (= bs!15893 d!63827))

(declare-fun m!287571 () Bool)

(assert (=> bs!15893 m!287571))

(assert (=> b!184681 d!63827))

(declare-fun lt!284982 () tuple2!16012)

(declare-fun d!63829 () Bool)

(assert (=> d!63829 (= lt!284982 (readNBitsLSBFirstsLoop!0 (_1!8645 lt!283971) nBits!348 i!590 lt!283980))))

(assert (=> d!63829 (= (readNBitsLSBFirstsLoopPure!0 (_1!8645 lt!283971) nBits!348 i!590 lt!283980) (tuple2!16003 (_2!8651 lt!284982) (_1!8651 lt!284982)))))

(declare-fun bs!15894 () Bool)

(assert (= bs!15894 d!63829))

(declare-fun m!287573 () Bool)

(assert (=> bs!15894 m!287573))

(assert (=> b!184681 d!63829))

(declare-fun d!63831 () Bool)

(assert (=> d!63831 (validate_offset_bits!1 ((_ sign_extend 32) (size!4320 (buf!4775 (_2!8643 lt!283991)))) ((_ sign_extend 32) (currentByte!9009 (_2!8643 lt!283974))) ((_ sign_extend 32) (currentBit!9004 (_2!8643 lt!283974))) lt!283983)))

(declare-fun lt!284985 () Unit!13215)

(declare-fun choose!9 (BitStream!7748 array!9792 (_ BitVec 64) BitStream!7748) Unit!13215)

(assert (=> d!63831 (= lt!284985 (choose!9 (_2!8643 lt!283974) (buf!4775 (_2!8643 lt!283991)) lt!283983 (BitStream!7749 (buf!4775 (_2!8643 lt!283991)) (currentByte!9009 (_2!8643 lt!283974)) (currentBit!9004 (_2!8643 lt!283974)))))))

(assert (=> d!63831 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8643 lt!283974) (buf!4775 (_2!8643 lt!283991)) lt!283983) lt!284985)))

(declare-fun bs!15895 () Bool)

(assert (= bs!15895 d!63831))

(assert (=> bs!15895 m!286915))

(declare-fun m!287575 () Bool)

(assert (=> bs!15895 m!287575))

(assert (=> b!184681 d!63831))

(declare-fun d!63833 () Bool)

(assert (=> d!63833 (= (invariant!0 (currentBit!9004 thiss!1204) (currentByte!9009 thiss!1204) (size!4320 (buf!4775 (_2!8643 lt!283974)))) (and (bvsge (currentBit!9004 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9004 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9009 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9009 thiss!1204) (size!4320 (buf!4775 (_2!8643 lt!283974)))) (and (= (currentBit!9004 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9009 thiss!1204) (size!4320 (buf!4775 (_2!8643 lt!283974))))))))))

(assert (=> b!184681 d!63833))

(declare-fun d!63835 () Bool)

(declare-fun e!128127 () Bool)

(assert (=> d!63835 e!128127))

(declare-fun res!153966 () Bool)

(assert (=> d!63835 (=> (not res!153966) (not e!128127))))

(declare-fun lt!285033 () tuple2!16000)

(assert (=> d!63835 (= res!153966 (isPrefixOf!0 (_1!8645 lt!285033) (_2!8645 lt!285033)))))

(declare-fun lt!285044 () BitStream!7748)

(assert (=> d!63835 (= lt!285033 (tuple2!16001 lt!285044 (_2!8643 lt!283991)))))

(declare-fun lt!285034 () Unit!13215)

(declare-fun lt!285026 () Unit!13215)

(assert (=> d!63835 (= lt!285034 lt!285026)))

(assert (=> d!63835 (isPrefixOf!0 lt!285044 (_2!8643 lt!283991))))

(assert (=> d!63835 (= lt!285026 (lemmaIsPrefixTransitive!0 lt!285044 (_2!8643 lt!283991) (_2!8643 lt!283991)))))

(declare-fun lt!285036 () Unit!13215)

(declare-fun lt!285027 () Unit!13215)

(assert (=> d!63835 (= lt!285036 lt!285027)))

(assert (=> d!63835 (isPrefixOf!0 lt!285044 (_2!8643 lt!283991))))

(assert (=> d!63835 (= lt!285027 (lemmaIsPrefixTransitive!0 lt!285044 (_2!8643 lt!283974) (_2!8643 lt!283991)))))

(declare-fun lt!285039 () Unit!13215)

(declare-fun e!128128 () Unit!13215)

(assert (=> d!63835 (= lt!285039 e!128128)))

(declare-fun c!9455 () Bool)

(assert (=> d!63835 (= c!9455 (not (= (size!4320 (buf!4775 (_2!8643 lt!283974))) #b00000000000000000000000000000000)))))

(declare-fun lt!285042 () Unit!13215)

(declare-fun lt!285030 () Unit!13215)

(assert (=> d!63835 (= lt!285042 lt!285030)))

(assert (=> d!63835 (isPrefixOf!0 (_2!8643 lt!283991) (_2!8643 lt!283991))))

(assert (=> d!63835 (= lt!285030 (lemmaIsPrefixRefl!0 (_2!8643 lt!283991)))))

(declare-fun lt!285035 () Unit!13215)

(declare-fun lt!285032 () Unit!13215)

(assert (=> d!63835 (= lt!285035 lt!285032)))

(assert (=> d!63835 (= lt!285032 (lemmaIsPrefixRefl!0 (_2!8643 lt!283991)))))

(declare-fun lt!285031 () Unit!13215)

(declare-fun lt!285045 () Unit!13215)

(assert (=> d!63835 (= lt!285031 lt!285045)))

(assert (=> d!63835 (isPrefixOf!0 lt!285044 lt!285044)))

(assert (=> d!63835 (= lt!285045 (lemmaIsPrefixRefl!0 lt!285044))))

(declare-fun lt!285037 () Unit!13215)

(declare-fun lt!285028 () Unit!13215)

(assert (=> d!63835 (= lt!285037 lt!285028)))

(assert (=> d!63835 (isPrefixOf!0 (_2!8643 lt!283974) (_2!8643 lt!283974))))

(assert (=> d!63835 (= lt!285028 (lemmaIsPrefixRefl!0 (_2!8643 lt!283974)))))

(assert (=> d!63835 (= lt!285044 (BitStream!7749 (buf!4775 (_2!8643 lt!283991)) (currentByte!9009 (_2!8643 lt!283974)) (currentBit!9004 (_2!8643 lt!283974))))))

(assert (=> d!63835 (isPrefixOf!0 (_2!8643 lt!283974) (_2!8643 lt!283991))))

(assert (=> d!63835 (= (reader!0 (_2!8643 lt!283974) (_2!8643 lt!283991)) lt!285033)))

(declare-fun b!185029 () Bool)

(declare-fun lt!285038 () Unit!13215)

(assert (=> b!185029 (= e!128128 lt!285038)))

(declare-fun lt!285029 () (_ BitVec 64))

(assert (=> b!185029 (= lt!285029 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!285041 () (_ BitVec 64))

(assert (=> b!185029 (= lt!285041 (bitIndex!0 (size!4320 (buf!4775 (_2!8643 lt!283974))) (currentByte!9009 (_2!8643 lt!283974)) (currentBit!9004 (_2!8643 lt!283974))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9792 array!9792 (_ BitVec 64) (_ BitVec 64)) Unit!13215)

(assert (=> b!185029 (= lt!285038 (arrayBitRangesEqSymmetric!0 (buf!4775 (_2!8643 lt!283974)) (buf!4775 (_2!8643 lt!283991)) lt!285029 lt!285041))))

(assert (=> b!185029 (arrayBitRangesEq!0 (buf!4775 (_2!8643 lt!283991)) (buf!4775 (_2!8643 lt!283974)) lt!285029 lt!285041)))

(declare-fun b!185030 () Bool)

(declare-fun res!153967 () Bool)

(assert (=> b!185030 (=> (not res!153967) (not e!128127))))

(assert (=> b!185030 (= res!153967 (isPrefixOf!0 (_1!8645 lt!285033) (_2!8643 lt!283974)))))

(declare-fun b!185031 () Bool)

(declare-fun lt!285043 () (_ BitVec 64))

(declare-fun lt!285040 () (_ BitVec 64))

(assert (=> b!185031 (= e!128127 (= (_1!8645 lt!285033) (withMovedBitIndex!0 (_2!8645 lt!285033) (bvsub lt!285043 lt!285040))))))

(assert (=> b!185031 (or (= (bvand lt!285043 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!285040 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!285043 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!285043 lt!285040) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!185031 (= lt!285040 (bitIndex!0 (size!4320 (buf!4775 (_2!8643 lt!283991))) (currentByte!9009 (_2!8643 lt!283991)) (currentBit!9004 (_2!8643 lt!283991))))))

(assert (=> b!185031 (= lt!285043 (bitIndex!0 (size!4320 (buf!4775 (_2!8643 lt!283974))) (currentByte!9009 (_2!8643 lt!283974)) (currentBit!9004 (_2!8643 lt!283974))))))

(declare-fun b!185032 () Bool)

(declare-fun Unit!13254 () Unit!13215)

(assert (=> b!185032 (= e!128128 Unit!13254)))

(declare-fun b!185033 () Bool)

(declare-fun res!153965 () Bool)

(assert (=> b!185033 (=> (not res!153965) (not e!128127))))

(assert (=> b!185033 (= res!153965 (isPrefixOf!0 (_2!8645 lt!285033) (_2!8643 lt!283991)))))

(assert (= (and d!63835 c!9455) b!185029))

(assert (= (and d!63835 (not c!9455)) b!185032))

(assert (= (and d!63835 res!153966) b!185030))

(assert (= (and b!185030 res!153967) b!185033))

(assert (= (and b!185033 res!153965) b!185031))

(declare-fun m!287577 () Bool)

(assert (=> b!185031 m!287577))

(assert (=> b!185031 m!286947))

(assert (=> b!185031 m!286881))

(declare-fun m!287579 () Bool)

(assert (=> b!185030 m!287579))

(declare-fun m!287581 () Bool)

(assert (=> b!185033 m!287581))

(assert (=> b!185029 m!286881))

(declare-fun m!287583 () Bool)

(assert (=> b!185029 m!287583))

(declare-fun m!287585 () Bool)

(assert (=> b!185029 m!287585))

(declare-fun m!287587 () Bool)

(assert (=> d!63835 m!287587))

(assert (=> d!63835 m!286955))

(declare-fun m!287589 () Bool)

(assert (=> d!63835 m!287589))

(declare-fun m!287591 () Bool)

(assert (=> d!63835 m!287591))

(declare-fun m!287593 () Bool)

(assert (=> d!63835 m!287593))

(declare-fun m!287595 () Bool)

(assert (=> d!63835 m!287595))

(declare-fun m!287597 () Bool)

(assert (=> d!63835 m!287597))

(declare-fun m!287599 () Bool)

(assert (=> d!63835 m!287599))

(declare-fun m!287601 () Bool)

(assert (=> d!63835 m!287601))

(declare-fun m!287603 () Bool)

(assert (=> d!63835 m!287603))

(assert (=> d!63835 m!287461))

(assert (=> b!184681 d!63835))

(declare-fun d!63837 () Bool)

(declare-fun e!128129 () Bool)

(assert (=> d!63837 e!128129))

(declare-fun res!153969 () Bool)

(assert (=> d!63837 (=> (not res!153969) (not e!128129))))

(declare-fun lt!285053 () tuple2!16000)

(assert (=> d!63837 (= res!153969 (isPrefixOf!0 (_1!8645 lt!285053) (_2!8645 lt!285053)))))

(declare-fun lt!285064 () BitStream!7748)

(assert (=> d!63837 (= lt!285053 (tuple2!16001 lt!285064 (_2!8643 lt!283991)))))

(declare-fun lt!285054 () Unit!13215)

(declare-fun lt!285046 () Unit!13215)

(assert (=> d!63837 (= lt!285054 lt!285046)))

(assert (=> d!63837 (isPrefixOf!0 lt!285064 (_2!8643 lt!283991))))

(assert (=> d!63837 (= lt!285046 (lemmaIsPrefixTransitive!0 lt!285064 (_2!8643 lt!283991) (_2!8643 lt!283991)))))

(declare-fun lt!285056 () Unit!13215)

(declare-fun lt!285047 () Unit!13215)

(assert (=> d!63837 (= lt!285056 lt!285047)))

(assert (=> d!63837 (isPrefixOf!0 lt!285064 (_2!8643 lt!283991))))

(assert (=> d!63837 (= lt!285047 (lemmaIsPrefixTransitive!0 lt!285064 thiss!1204 (_2!8643 lt!283991)))))

(declare-fun lt!285059 () Unit!13215)

(declare-fun e!128130 () Unit!13215)

(assert (=> d!63837 (= lt!285059 e!128130)))

(declare-fun c!9456 () Bool)

(assert (=> d!63837 (= c!9456 (not (= (size!4320 (buf!4775 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!285062 () Unit!13215)

(declare-fun lt!285050 () Unit!13215)

(assert (=> d!63837 (= lt!285062 lt!285050)))

(assert (=> d!63837 (isPrefixOf!0 (_2!8643 lt!283991) (_2!8643 lt!283991))))

(assert (=> d!63837 (= lt!285050 (lemmaIsPrefixRefl!0 (_2!8643 lt!283991)))))

(declare-fun lt!285055 () Unit!13215)

(declare-fun lt!285052 () Unit!13215)

(assert (=> d!63837 (= lt!285055 lt!285052)))

(assert (=> d!63837 (= lt!285052 (lemmaIsPrefixRefl!0 (_2!8643 lt!283991)))))

(declare-fun lt!285051 () Unit!13215)

(declare-fun lt!285065 () Unit!13215)

(assert (=> d!63837 (= lt!285051 lt!285065)))

(assert (=> d!63837 (isPrefixOf!0 lt!285064 lt!285064)))

(assert (=> d!63837 (= lt!285065 (lemmaIsPrefixRefl!0 lt!285064))))

(declare-fun lt!285057 () Unit!13215)

(declare-fun lt!285048 () Unit!13215)

(assert (=> d!63837 (= lt!285057 lt!285048)))

(assert (=> d!63837 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!63837 (= lt!285048 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!63837 (= lt!285064 (BitStream!7749 (buf!4775 (_2!8643 lt!283991)) (currentByte!9009 thiss!1204) (currentBit!9004 thiss!1204)))))

(assert (=> d!63837 (isPrefixOf!0 thiss!1204 (_2!8643 lt!283991))))

(assert (=> d!63837 (= (reader!0 thiss!1204 (_2!8643 lt!283991)) lt!285053)))

(declare-fun b!185034 () Bool)

(declare-fun lt!285058 () Unit!13215)

(assert (=> b!185034 (= e!128130 lt!285058)))

(declare-fun lt!285049 () (_ BitVec 64))

(assert (=> b!185034 (= lt!285049 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!285061 () (_ BitVec 64))

(assert (=> b!185034 (= lt!285061 (bitIndex!0 (size!4320 (buf!4775 thiss!1204)) (currentByte!9009 thiss!1204) (currentBit!9004 thiss!1204)))))

(assert (=> b!185034 (= lt!285058 (arrayBitRangesEqSymmetric!0 (buf!4775 thiss!1204) (buf!4775 (_2!8643 lt!283991)) lt!285049 lt!285061))))

(assert (=> b!185034 (arrayBitRangesEq!0 (buf!4775 (_2!8643 lt!283991)) (buf!4775 thiss!1204) lt!285049 lt!285061)))

(declare-fun b!185035 () Bool)

(declare-fun res!153970 () Bool)

(assert (=> b!185035 (=> (not res!153970) (not e!128129))))

(assert (=> b!185035 (= res!153970 (isPrefixOf!0 (_1!8645 lt!285053) thiss!1204))))

(declare-fun lt!285060 () (_ BitVec 64))

(declare-fun lt!285063 () (_ BitVec 64))

(declare-fun b!185036 () Bool)

(assert (=> b!185036 (= e!128129 (= (_1!8645 lt!285053) (withMovedBitIndex!0 (_2!8645 lt!285053) (bvsub lt!285063 lt!285060))))))

(assert (=> b!185036 (or (= (bvand lt!285063 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!285060 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!285063 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!285063 lt!285060) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!185036 (= lt!285060 (bitIndex!0 (size!4320 (buf!4775 (_2!8643 lt!283991))) (currentByte!9009 (_2!8643 lt!283991)) (currentBit!9004 (_2!8643 lt!283991))))))

(assert (=> b!185036 (= lt!285063 (bitIndex!0 (size!4320 (buf!4775 thiss!1204)) (currentByte!9009 thiss!1204) (currentBit!9004 thiss!1204)))))

(declare-fun b!185037 () Bool)

(declare-fun Unit!13255 () Unit!13215)

(assert (=> b!185037 (= e!128130 Unit!13255)))

(declare-fun b!185038 () Bool)

(declare-fun res!153968 () Bool)

(assert (=> b!185038 (=> (not res!153968) (not e!128129))))

(assert (=> b!185038 (= res!153968 (isPrefixOf!0 (_2!8645 lt!285053) (_2!8643 lt!283991)))))

(assert (= (and d!63837 c!9456) b!185034))

(assert (= (and d!63837 (not c!9456)) b!185037))

(assert (= (and d!63837 res!153969) b!185035))

(assert (= (and b!185035 res!153970) b!185038))

(assert (= (and b!185038 res!153968) b!185036))

(declare-fun m!287605 () Bool)

(assert (=> b!185036 m!287605))

(assert (=> b!185036 m!286947))

(assert (=> b!185036 m!286883))

(declare-fun m!287607 () Bool)

(assert (=> b!185035 m!287607))

(declare-fun m!287609 () Bool)

(assert (=> b!185038 m!287609))

(assert (=> b!185034 m!286883))

(declare-fun m!287611 () Bool)

(assert (=> b!185034 m!287611))

(declare-fun m!287613 () Bool)

(assert (=> b!185034 m!287613))

(declare-fun m!287615 () Bool)

(assert (=> d!63837 m!287615))

(assert (=> d!63837 m!286949))

(declare-fun m!287617 () Bool)

(assert (=> d!63837 m!287617))

(declare-fun m!287619 () Bool)

(assert (=> d!63837 m!287619))

(declare-fun m!287621 () Bool)

(assert (=> d!63837 m!287621))

(assert (=> d!63837 m!287595))

(declare-fun m!287623 () Bool)

(assert (=> d!63837 m!287623))

(assert (=> d!63837 m!287599))

(declare-fun m!287625 () Bool)

(assert (=> d!63837 m!287625))

(declare-fun m!287627 () Bool)

(assert (=> d!63837 m!287627))

(declare-fun m!287629 () Bool)

(assert (=> d!63837 m!287629))

(assert (=> b!184681 d!63837))

(declare-fun d!63839 () Bool)

(declare-fun e!128131 () Bool)

(assert (=> d!63839 e!128131))

(declare-fun res!153972 () Bool)

(assert (=> d!63839 (=> (not res!153972) (not e!128131))))

(declare-fun lt!285070 () (_ BitVec 64))

(declare-fun lt!285066 () (_ BitVec 64))

(declare-fun lt!285069 () (_ BitVec 64))

(assert (=> d!63839 (= res!153972 (= lt!285066 (bvsub lt!285070 lt!285069)))))

(assert (=> d!63839 (or (= (bvand lt!285070 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!285069 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!285070 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!285070 lt!285069) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63839 (= lt!285069 (remainingBits!0 ((_ sign_extend 32) (size!4320 (buf!4775 (_1!8644 lt!283977)))) ((_ sign_extend 32) (currentByte!9009 (_1!8644 lt!283977))) ((_ sign_extend 32) (currentBit!9004 (_1!8644 lt!283977)))))))

(declare-fun lt!285067 () (_ BitVec 64))

(declare-fun lt!285068 () (_ BitVec 64))

(assert (=> d!63839 (= lt!285070 (bvmul lt!285067 lt!285068))))

(assert (=> d!63839 (or (= lt!285067 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!285068 (bvsdiv (bvmul lt!285067 lt!285068) lt!285067)))))

(assert (=> d!63839 (= lt!285068 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63839 (= lt!285067 ((_ sign_extend 32) (size!4320 (buf!4775 (_1!8644 lt!283977)))))))

(assert (=> d!63839 (= lt!285066 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9009 (_1!8644 lt!283977))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9004 (_1!8644 lt!283977)))))))

(assert (=> d!63839 (invariant!0 (currentBit!9004 (_1!8644 lt!283977)) (currentByte!9009 (_1!8644 lt!283977)) (size!4320 (buf!4775 (_1!8644 lt!283977))))))

(assert (=> d!63839 (= (bitIndex!0 (size!4320 (buf!4775 (_1!8644 lt!283977))) (currentByte!9009 (_1!8644 lt!283977)) (currentBit!9004 (_1!8644 lt!283977))) lt!285066)))

(declare-fun b!185039 () Bool)

(declare-fun res!153971 () Bool)

(assert (=> b!185039 (=> (not res!153971) (not e!128131))))

(assert (=> b!185039 (= res!153971 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!285066))))

(declare-fun b!185040 () Bool)

(declare-fun lt!285071 () (_ BitVec 64))

(assert (=> b!185040 (= e!128131 (bvsle lt!285066 (bvmul lt!285071 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!185040 (or (= lt!285071 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!285071 #b0000000000000000000000000000000000000000000000000000000000001000) lt!285071)))))

(assert (=> b!185040 (= lt!285071 ((_ sign_extend 32) (size!4320 (buf!4775 (_1!8644 lt!283977)))))))

(assert (= (and d!63839 res!153972) b!185039))

(assert (= (and b!185039 res!153971) b!185040))

(declare-fun m!287631 () Bool)

(assert (=> d!63839 m!287631))

(declare-fun m!287633 () Bool)

(assert (=> d!63839 m!287633))

(assert (=> b!184681 d!63839))

(declare-fun d!63841 () Bool)

(assert (=> d!63841 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4320 (buf!4775 (_2!8643 lt!283991)))) ((_ sign_extend 32) (currentByte!9009 (_2!8643 lt!283974))) ((_ sign_extend 32) (currentBit!9004 (_2!8643 lt!283974))) lt!283983) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4320 (buf!4775 (_2!8643 lt!283991)))) ((_ sign_extend 32) (currentByte!9009 (_2!8643 lt!283974))) ((_ sign_extend 32) (currentBit!9004 (_2!8643 lt!283974)))) lt!283983))))

(declare-fun bs!15896 () Bool)

(assert (= bs!15896 d!63841))

(declare-fun m!287635 () Bool)

(assert (=> bs!15896 m!287635))

(assert (=> b!184681 d!63841))

(declare-fun d!63843 () Bool)

(assert (=> d!63843 (validate_offset_bits!1 ((_ sign_extend 32) (size!4320 (buf!4775 (_2!8643 lt!283991)))) ((_ sign_extend 32) (currentByte!9009 thiss!1204)) ((_ sign_extend 32) (currentBit!9004 thiss!1204)) lt!283976)))

(declare-fun lt!285072 () Unit!13215)

(assert (=> d!63843 (= lt!285072 (choose!9 thiss!1204 (buf!4775 (_2!8643 lt!283991)) lt!283976 (BitStream!7749 (buf!4775 (_2!8643 lt!283991)) (currentByte!9009 thiss!1204) (currentBit!9004 thiss!1204))))))

(assert (=> d!63843 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4775 (_2!8643 lt!283991)) lt!283976) lt!285072)))

(declare-fun bs!15897 () Bool)

(assert (= bs!15897 d!63843))

(assert (=> bs!15897 m!286911))

(declare-fun m!287637 () Bool)

(assert (=> bs!15897 m!287637))

(assert (=> b!184681 d!63843))

(declare-fun d!63845 () Bool)

(assert (=> d!63845 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!184681 d!63845))

(declare-fun d!63847 () Bool)

(assert (=> d!63847 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4320 (buf!4775 (_2!8643 lt!283991)))) ((_ sign_extend 32) (currentByte!9009 thiss!1204)) ((_ sign_extend 32) (currentBit!9004 thiss!1204)) lt!283976) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4320 (buf!4775 (_2!8643 lt!283991)))) ((_ sign_extend 32) (currentByte!9009 thiss!1204)) ((_ sign_extend 32) (currentBit!9004 thiss!1204))) lt!283976))))

(declare-fun bs!15898 () Bool)

(assert (= bs!15898 d!63847))

(declare-fun m!287639 () Bool)

(assert (=> bs!15898 m!287639))

(assert (=> b!184681 d!63847))

(declare-fun d!63849 () Bool)

(declare-fun lt!285073 () tuple2!16014)

(assert (=> d!63849 (= lt!285073 (readBit!0 (BitStream!7749 (buf!4775 (_2!8643 lt!283991)) (currentByte!9009 thiss!1204) (currentBit!9004 thiss!1204))))))

(assert (=> d!63849 (= (readBitPure!0 (BitStream!7749 (buf!4775 (_2!8643 lt!283991)) (currentByte!9009 thiss!1204) (currentBit!9004 thiss!1204))) (tuple2!15999 (_2!8652 lt!285073) (_1!8652 lt!285073)))))

(declare-fun bs!15899 () Bool)

(assert (= bs!15899 d!63849))

(declare-fun m!287641 () Bool)

(assert (=> bs!15899 m!287641))

(assert (=> b!184681 d!63849))

(declare-fun d!63851 () Bool)

(declare-fun e!128132 () Bool)

(assert (=> d!63851 e!128132))

(declare-fun res!153974 () Bool)

(assert (=> d!63851 (=> (not res!153974) (not e!128132))))

(declare-fun lt!285074 () (_ BitVec 64))

(declare-fun lt!285077 () (_ BitVec 64))

(declare-fun lt!285078 () (_ BitVec 64))

(assert (=> d!63851 (= res!153974 (= lt!285074 (bvsub lt!285078 lt!285077)))))

(assert (=> d!63851 (or (= (bvand lt!285078 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!285077 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!285078 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!285078 lt!285077) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63851 (= lt!285077 (remainingBits!0 ((_ sign_extend 32) (size!4320 (buf!4775 (_1!8644 lt!283992)))) ((_ sign_extend 32) (currentByte!9009 (_1!8644 lt!283992))) ((_ sign_extend 32) (currentBit!9004 (_1!8644 lt!283992)))))))

(declare-fun lt!285075 () (_ BitVec 64))

(declare-fun lt!285076 () (_ BitVec 64))

(assert (=> d!63851 (= lt!285078 (bvmul lt!285075 lt!285076))))

(assert (=> d!63851 (or (= lt!285075 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!285076 (bvsdiv (bvmul lt!285075 lt!285076) lt!285075)))))

(assert (=> d!63851 (= lt!285076 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63851 (= lt!285075 ((_ sign_extend 32) (size!4320 (buf!4775 (_1!8644 lt!283992)))))))

(assert (=> d!63851 (= lt!285074 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9009 (_1!8644 lt!283992))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9004 (_1!8644 lt!283992)))))))

(assert (=> d!63851 (invariant!0 (currentBit!9004 (_1!8644 lt!283992)) (currentByte!9009 (_1!8644 lt!283992)) (size!4320 (buf!4775 (_1!8644 lt!283992))))))

(assert (=> d!63851 (= (bitIndex!0 (size!4320 (buf!4775 (_1!8644 lt!283992))) (currentByte!9009 (_1!8644 lt!283992)) (currentBit!9004 (_1!8644 lt!283992))) lt!285074)))

(declare-fun b!185041 () Bool)

(declare-fun res!153973 () Bool)

(assert (=> b!185041 (=> (not res!153973) (not e!128132))))

(assert (=> b!185041 (= res!153973 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!285074))))

(declare-fun b!185042 () Bool)

(declare-fun lt!285079 () (_ BitVec 64))

(assert (=> b!185042 (= e!128132 (bvsle lt!285074 (bvmul lt!285079 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!185042 (or (= lt!285079 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!285079 #b0000000000000000000000000000000000000000000000000000000000001000) lt!285079)))))

(assert (=> b!185042 (= lt!285079 ((_ sign_extend 32) (size!4320 (buf!4775 (_1!8644 lt!283992)))))))

(assert (= (and d!63851 res!153974) b!185041))

(assert (= (and b!185041 res!153973) b!185042))

(declare-fun m!287643 () Bool)

(assert (=> d!63851 m!287643))

(declare-fun m!287645 () Bool)

(assert (=> d!63851 m!287645))

(assert (=> b!184681 d!63851))

(assert (=> b!184682 d!63787))

(declare-fun d!63853 () Bool)

(declare-fun lt!285080 () tuple2!16014)

(assert (=> d!63853 (= lt!285080 (readBit!0 (readerFrom!0 (_2!8643 lt!283974) (currentBit!9004 thiss!1204) (currentByte!9009 thiss!1204))))))

(assert (=> d!63853 (= (readBitPure!0 (readerFrom!0 (_2!8643 lt!283974) (currentBit!9004 thiss!1204) (currentByte!9009 thiss!1204))) (tuple2!15999 (_2!8652 lt!285080) (_1!8652 lt!285080)))))

(declare-fun bs!15900 () Bool)

(assert (= bs!15900 d!63853))

(assert (=> bs!15900 m!286887))

(declare-fun m!287647 () Bool)

(assert (=> bs!15900 m!287647))

(assert (=> b!184685 d!63853))

(declare-fun d!63855 () Bool)

(declare-fun e!128135 () Bool)

(assert (=> d!63855 e!128135))

(declare-fun res!153978 () Bool)

(assert (=> d!63855 (=> (not res!153978) (not e!128135))))

(assert (=> d!63855 (= res!153978 (invariant!0 (currentBit!9004 (_2!8643 lt!283974)) (currentByte!9009 (_2!8643 lt!283974)) (size!4320 (buf!4775 (_2!8643 lt!283974)))))))

(assert (=> d!63855 (= (readerFrom!0 (_2!8643 lt!283974) (currentBit!9004 thiss!1204) (currentByte!9009 thiss!1204)) (BitStream!7749 (buf!4775 (_2!8643 lt!283974)) (currentByte!9009 thiss!1204) (currentBit!9004 thiss!1204)))))

(declare-fun b!185045 () Bool)

(assert (=> b!185045 (= e!128135 (invariant!0 (currentBit!9004 thiss!1204) (currentByte!9009 thiss!1204) (size!4320 (buf!4775 (_2!8643 lt!283974)))))))

(assert (= (and d!63855 res!153978) b!185045))

(assert (=> d!63855 m!287555))

(assert (=> b!185045 m!286933))

(assert (=> b!184685 d!63855))

(declare-fun d!63857 () Bool)

(assert (=> d!63857 (= (invariant!0 (currentBit!9004 thiss!1204) (currentByte!9009 thiss!1204) (size!4320 (buf!4775 (_2!8643 lt!283991)))) (and (bvsge (currentBit!9004 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9004 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9009 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9009 thiss!1204) (size!4320 (buf!4775 (_2!8643 lt!283991)))) (and (= (currentBit!9004 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9009 thiss!1204) (size!4320 (buf!4775 (_2!8643 lt!283991))))))))))

(assert (=> b!184675 d!63857))

(declare-fun d!63859 () Bool)

(declare-fun res!153981 () Bool)

(declare-fun e!128136 () Bool)

(assert (=> d!63859 (=> (not res!153981) (not e!128136))))

(assert (=> d!63859 (= res!153981 (= (size!4320 (buf!4775 (_2!8643 lt!283974))) (size!4320 (buf!4775 (_2!8643 lt!283991)))))))

(assert (=> d!63859 (= (isPrefixOf!0 (_2!8643 lt!283974) (_2!8643 lt!283991)) e!128136)))

(declare-fun b!185046 () Bool)

(declare-fun res!153979 () Bool)

(assert (=> b!185046 (=> (not res!153979) (not e!128136))))

(assert (=> b!185046 (= res!153979 (bvsle (bitIndex!0 (size!4320 (buf!4775 (_2!8643 lt!283974))) (currentByte!9009 (_2!8643 lt!283974)) (currentBit!9004 (_2!8643 lt!283974))) (bitIndex!0 (size!4320 (buf!4775 (_2!8643 lt!283991))) (currentByte!9009 (_2!8643 lt!283991)) (currentBit!9004 (_2!8643 lt!283991)))))))

(declare-fun b!185047 () Bool)

(declare-fun e!128137 () Bool)

(assert (=> b!185047 (= e!128136 e!128137)))

(declare-fun res!153980 () Bool)

(assert (=> b!185047 (=> res!153980 e!128137)))

(assert (=> b!185047 (= res!153980 (= (size!4320 (buf!4775 (_2!8643 lt!283974))) #b00000000000000000000000000000000))))

(declare-fun b!185048 () Bool)

(assert (=> b!185048 (= e!128137 (arrayBitRangesEq!0 (buf!4775 (_2!8643 lt!283974)) (buf!4775 (_2!8643 lt!283991)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4320 (buf!4775 (_2!8643 lt!283974))) (currentByte!9009 (_2!8643 lt!283974)) (currentBit!9004 (_2!8643 lt!283974)))))))

(assert (= (and d!63859 res!153981) b!185046))

(assert (= (and b!185046 res!153979) b!185047))

(assert (= (and b!185047 (not res!153980)) b!185048))

(assert (=> b!185046 m!286881))

(assert (=> b!185046 m!286947))

(assert (=> b!185048 m!286881))

(assert (=> b!185048 m!286881))

(declare-fun m!287649 () Bool)

(assert (=> b!185048 m!287649))

(assert (=> b!184673 d!63859))

(assert (=> b!184674 d!63815))

(assert (=> b!184674 d!63817))

(declare-fun d!63861 () Bool)

(declare-fun e!128143 () Bool)

(assert (=> d!63861 e!128143))

(declare-fun res!153993 () Bool)

(assert (=> d!63861 (=> (not res!153993) (not e!128143))))

(declare-fun lt!285092 () tuple2!15996)

(assert (=> d!63861 (= res!153993 (= (size!4320 (buf!4775 thiss!1204)) (size!4320 (buf!4775 (_2!8643 lt!285092)))))))

(declare-fun choose!16 (BitStream!7748 Bool) tuple2!15996)

(assert (=> d!63861 (= lt!285092 (choose!16 thiss!1204 lt!283981))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!63861 (validate_offset_bit!0 ((_ sign_extend 32) (size!4320 (buf!4775 thiss!1204))) ((_ sign_extend 32) (currentByte!9009 thiss!1204)) ((_ sign_extend 32) (currentBit!9004 thiss!1204)))))

(assert (=> d!63861 (= (appendBit!0 thiss!1204 lt!283981) lt!285092)))

(declare-fun b!185059 () Bool)

(declare-fun res!153992 () Bool)

(assert (=> b!185059 (=> (not res!153992) (not e!128143))))

(assert (=> b!185059 (= res!153992 (isPrefixOf!0 thiss!1204 (_2!8643 lt!285092)))))

(declare-fun b!185060 () Bool)

(declare-fun e!128142 () Bool)

(assert (=> b!185060 (= e!128143 e!128142)))

(declare-fun res!153990 () Bool)

(assert (=> b!185060 (=> (not res!153990) (not e!128142))))

(declare-fun lt!285091 () tuple2!15998)

(assert (=> b!185060 (= res!153990 (and (= (_2!8644 lt!285091) lt!283981) (= (_1!8644 lt!285091) (_2!8643 lt!285092))))))

(assert (=> b!185060 (= lt!285091 (readBitPure!0 (readerFrom!0 (_2!8643 lt!285092) (currentBit!9004 thiss!1204) (currentByte!9009 thiss!1204))))))

(declare-fun b!185061 () Bool)

(assert (=> b!185061 (= e!128142 (= (bitIndex!0 (size!4320 (buf!4775 (_1!8644 lt!285091))) (currentByte!9009 (_1!8644 lt!285091)) (currentBit!9004 (_1!8644 lt!285091))) (bitIndex!0 (size!4320 (buf!4775 (_2!8643 lt!285092))) (currentByte!9009 (_2!8643 lt!285092)) (currentBit!9004 (_2!8643 lt!285092)))))))

(declare-fun b!185058 () Bool)

(declare-fun res!153991 () Bool)

(assert (=> b!185058 (=> (not res!153991) (not e!128143))))

(declare-fun lt!285090 () (_ BitVec 64))

(declare-fun lt!285089 () (_ BitVec 64))

(assert (=> b!185058 (= res!153991 (= (bitIndex!0 (size!4320 (buf!4775 (_2!8643 lt!285092))) (currentByte!9009 (_2!8643 lt!285092)) (currentBit!9004 (_2!8643 lt!285092))) (bvadd lt!285090 lt!285089)))))

(assert (=> b!185058 (or (not (= (bvand lt!285090 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!285089 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!285090 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!285090 lt!285089) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!185058 (= lt!285089 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!185058 (= lt!285090 (bitIndex!0 (size!4320 (buf!4775 thiss!1204)) (currentByte!9009 thiss!1204) (currentBit!9004 thiss!1204)))))

(assert (= (and d!63861 res!153993) b!185058))

(assert (= (and b!185058 res!153991) b!185059))

(assert (= (and b!185059 res!153992) b!185060))

(assert (= (and b!185060 res!153990) b!185061))

(declare-fun m!287651 () Bool)

(assert (=> b!185059 m!287651))

(declare-fun m!287653 () Bool)

(assert (=> b!185061 m!287653))

(declare-fun m!287655 () Bool)

(assert (=> b!185061 m!287655))

(assert (=> b!185058 m!287655))

(assert (=> b!185058 m!286883))

(declare-fun m!287657 () Bool)

(assert (=> b!185060 m!287657))

(assert (=> b!185060 m!287657))

(declare-fun m!287659 () Bool)

(assert (=> b!185060 m!287659))

(declare-fun m!287661 () Bool)

(assert (=> d!63861 m!287661))

(declare-fun m!287663 () Bool)

(assert (=> d!63861 m!287663))

(assert (=> b!184674 d!63861))

(push 1)

(assert (not b!184997))

(assert (not d!63853))

(assert (not b!185058))

(assert (not d!63773))

(assert (not b!185048))

(assert (not d!63783))

(assert (not b!185060))

(assert (not b!185035))

(assert (not b!184996))

(assert (not d!63775))

(assert (not d!63849))

(assert (not d!63779))

(assert (not d!63823))

(assert (not d!63843))

(assert (not d!63785))

(assert (not b!185008))

(assert (not b!185036))

(assert (not bm!2978))

(assert (not d!63855))

(assert (not d!63777))

(assert (not d!63795))

(assert (not b!185011))

(assert (not b!185045))

(assert (not b!185001))

(assert (not b!184853))

(assert (not d!63829))

(assert (not d!63847))

(assert (not d!63851))

(assert (not d!63861))

(assert (not d!63839))

(assert (not b!185029))

(assert (not d!63835))

(assert (not d!63825))

(assert (not b!185061))

(assert (not d!63841))

(assert (not b!185033))

(assert (not b!185059))

(assert (not d!63817))

(assert (not b!185038))

(assert (not b!185006))

(assert (not b!185030))

(assert (not b!184830))

(assert (not d!63821))

(assert (not b!184846))

(assert (not d!63831))

(assert (not d!63791))

(assert (not b!185046))

(assert (not d!63837))

(assert (not b!185007))

(assert (not b!184998))

(assert (not d!63827))

(assert (not d!63797))

(assert (not b!185004))

(assert (not b!184848))

(assert (not d!63815))

(assert (not b!185034))

(assert (not b!184851))

(assert (not b!185002))

(assert (not b!185031))

(check-sat)

(pop 1)

(push 1)

(check-sat)

