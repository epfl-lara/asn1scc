; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28008 () Bool)

(assert start!28008)

(declare-fun res!121188 () Bool)

(declare-fun e!96644 () Bool)

(assert (=> start!28008 (=> (not res!121188) (not e!96644))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6600 0))(
  ( (array!6601 (arr!3721 (Array (_ BitVec 32) (_ BitVec 8))) (size!2988 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6600)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!28008 (= res!121188 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2988 arr!237))))))

(assert (=> start!28008 e!96644))

(assert (=> start!28008 true))

(declare-fun array_inv!2777 (array!6600) Bool)

(assert (=> start!28008 (array_inv!2777 arr!237)))

(declare-datatypes ((BitStream!5234 0))(
  ( (BitStream!5235 (buf!3427 array!6600) (currentByte!6317 (_ BitVec 32)) (currentBit!6312 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5234)

(declare-fun e!96640 () Bool)

(declare-fun inv!12 (BitStream!5234) Bool)

(assert (=> start!28008 (and (inv!12 thiss!1634) e!96640)))

(declare-fun b!144980 () Bool)

(declare-fun res!121185 () Bool)

(assert (=> b!144980 (=> (not res!121185) (not e!96644))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!144980 (= res!121185 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2988 (buf!3427 thiss!1634))) ((_ sign_extend 32) (currentByte!6317 thiss!1634)) ((_ sign_extend 32) (currentBit!6312 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!144981 () Bool)

(declare-fun res!121197 () Bool)

(assert (=> b!144981 (=> (not res!121197) (not e!96644))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!144981 (= res!121197 (invariant!0 (currentBit!6312 thiss!1634) (currentByte!6317 thiss!1634) (size!2988 (buf!3427 thiss!1634))))))

(declare-fun b!144982 () Bool)

(assert (=> b!144982 (= e!96644 (not true))))

(declare-fun e!96641 () Bool)

(assert (=> b!144982 e!96641))

(declare-fun res!121198 () Bool)

(assert (=> b!144982 (=> (not res!121198) (not e!96641))))

(declare-datatypes ((Unit!9049 0))(
  ( (Unit!9050) )
))
(declare-datatypes ((tuple2!12946 0))(
  ( (tuple2!12947 (_1!6819 Unit!9049) (_2!6819 BitStream!5234)) )
))
(declare-fun lt!224669 () tuple2!12946)

(assert (=> b!144982 (= res!121198 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2988 (buf!3427 (_2!6819 lt!224669)))) ((_ sign_extend 32) (currentByte!6317 thiss!1634)) ((_ sign_extend 32) (currentBit!6312 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!224667 () Unit!9049)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5234 array!6600 (_ BitVec 32)) Unit!9049)

(assert (=> b!144982 (= lt!224667 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3427 (_2!6819 lt!224669)) (bvsub to!404 from!447)))))

(declare-datatypes ((tuple2!12948 0))(
  ( (tuple2!12949 (_1!6820 BitStream!5234) (_2!6820 BitStream!5234)) )
))
(declare-fun lt!224666 () tuple2!12948)

(declare-datatypes ((tuple2!12950 0))(
  ( (tuple2!12951 (_1!6821 BitStream!5234) (_2!6821 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5234) tuple2!12950)

(assert (=> b!144982 (= (_2!6821 (readBytePure!0 (_1!6820 lt!224666))) (select (arr!3721 arr!237) from!447))))

(declare-fun lt!224670 () tuple2!12948)

(declare-fun lt!224664 () tuple2!12946)

(declare-fun reader!0 (BitStream!5234 BitStream!5234) tuple2!12948)

(assert (=> b!144982 (= lt!224670 (reader!0 (_2!6819 lt!224664) (_2!6819 lt!224669)))))

(assert (=> b!144982 (= lt!224666 (reader!0 thiss!1634 (_2!6819 lt!224669)))))

(declare-fun e!96638 () Bool)

(assert (=> b!144982 e!96638))

(declare-fun res!121196 () Bool)

(assert (=> b!144982 (=> (not res!121196) (not e!96638))))

(declare-fun lt!224675 () tuple2!12950)

(declare-fun lt!224668 () tuple2!12950)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!144982 (= res!121196 (= (bitIndex!0 (size!2988 (buf!3427 (_1!6821 lt!224675))) (currentByte!6317 (_1!6821 lt!224675)) (currentBit!6312 (_1!6821 lt!224675))) (bitIndex!0 (size!2988 (buf!3427 (_1!6821 lt!224668))) (currentByte!6317 (_1!6821 lt!224668)) (currentBit!6312 (_1!6821 lt!224668)))))))

(declare-fun lt!224671 () Unit!9049)

(declare-fun lt!224660 () BitStream!5234)

(declare-fun readBytePrefixLemma!0 (BitStream!5234 BitStream!5234) Unit!9049)

(assert (=> b!144982 (= lt!224671 (readBytePrefixLemma!0 lt!224660 (_2!6819 lt!224669)))))

(assert (=> b!144982 (= lt!224668 (readBytePure!0 (BitStream!5235 (buf!3427 (_2!6819 lt!224669)) (currentByte!6317 thiss!1634) (currentBit!6312 thiss!1634))))))

(assert (=> b!144982 (= lt!224675 (readBytePure!0 lt!224660))))

(assert (=> b!144982 (= lt!224660 (BitStream!5235 (buf!3427 (_2!6819 lt!224664)) (currentByte!6317 thiss!1634) (currentBit!6312 thiss!1634)))))

(declare-fun e!96635 () Bool)

(assert (=> b!144982 e!96635))

(declare-fun res!121194 () Bool)

(assert (=> b!144982 (=> (not res!121194) (not e!96635))))

(declare-fun isPrefixOf!0 (BitStream!5234 BitStream!5234) Bool)

(assert (=> b!144982 (= res!121194 (isPrefixOf!0 thiss!1634 (_2!6819 lt!224669)))))

(declare-fun lt!224663 () Unit!9049)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5234 BitStream!5234 BitStream!5234) Unit!9049)

(assert (=> b!144982 (= lt!224663 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6819 lt!224664) (_2!6819 lt!224669)))))

(declare-fun e!96645 () Bool)

(assert (=> b!144982 e!96645))

(declare-fun res!121187 () Bool)

(assert (=> b!144982 (=> (not res!121187) (not e!96645))))

(assert (=> b!144982 (= res!121187 (= (size!2988 (buf!3427 (_2!6819 lt!224664))) (size!2988 (buf!3427 (_2!6819 lt!224669)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5234 array!6600 (_ BitVec 32) (_ BitVec 32)) tuple2!12946)

(assert (=> b!144982 (= lt!224669 (appendByteArrayLoop!0 (_2!6819 lt!224664) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!144982 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2988 (buf!3427 (_2!6819 lt!224664)))) ((_ sign_extend 32) (currentByte!6317 (_2!6819 lt!224664))) ((_ sign_extend 32) (currentBit!6312 (_2!6819 lt!224664))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!224665 () Unit!9049)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5234 BitStream!5234 (_ BitVec 64) (_ BitVec 32)) Unit!9049)

(assert (=> b!144982 (= lt!224665 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6819 lt!224664) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!96636 () Bool)

(assert (=> b!144982 e!96636))

(declare-fun res!121189 () Bool)

(assert (=> b!144982 (=> (not res!121189) (not e!96636))))

(assert (=> b!144982 (= res!121189 (= (size!2988 (buf!3427 thiss!1634)) (size!2988 (buf!3427 (_2!6819 lt!224664)))))))

(declare-fun appendByte!0 (BitStream!5234 (_ BitVec 8)) tuple2!12946)

(assert (=> b!144982 (= lt!224664 (appendByte!0 thiss!1634 (select (arr!3721 arr!237) from!447)))))

(declare-fun b!144983 () Bool)

(assert (=> b!144983 (= e!96640 (array_inv!2777 (buf!3427 thiss!1634)))))

(declare-fun b!144984 () Bool)

(declare-fun e!96639 () Bool)

(assert (=> b!144984 (= e!96645 e!96639)))

(declare-fun res!121193 () Bool)

(assert (=> b!144984 (=> (not res!121193) (not e!96639))))

(declare-fun lt!224661 () (_ BitVec 64))

(assert (=> b!144984 (= res!121193 (= (bitIndex!0 (size!2988 (buf!3427 (_2!6819 lt!224669))) (currentByte!6317 (_2!6819 lt!224669)) (currentBit!6312 (_2!6819 lt!224669))) (bvadd (bitIndex!0 (size!2988 (buf!3427 (_2!6819 lt!224664))) (currentByte!6317 (_2!6819 lt!224664)) (currentBit!6312 (_2!6819 lt!224664))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!224661))))))

(assert (=> b!144984 (= lt!224661 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!144985 () Bool)

(declare-fun res!121195 () Bool)

(assert (=> b!144985 (=> (not res!121195) (not e!96636))))

(assert (=> b!144985 (= res!121195 (= (bitIndex!0 (size!2988 (buf!3427 (_2!6819 lt!224664))) (currentByte!6317 (_2!6819 lt!224664)) (currentBit!6312 (_2!6819 lt!224664))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2988 (buf!3427 thiss!1634)) (currentByte!6317 thiss!1634) (currentBit!6312 thiss!1634)))))))

(declare-fun b!144986 () Bool)

(declare-fun res!121192 () Bool)

(assert (=> b!144986 (=> (not res!121192) (not e!96644))))

(assert (=> b!144986 (= res!121192 (bvslt from!447 to!404))))

(declare-fun b!144987 () Bool)

(declare-fun e!96642 () Bool)

(assert (=> b!144987 (= e!96639 (not e!96642))))

(declare-fun res!121190 () Bool)

(assert (=> b!144987 (=> res!121190 e!96642)))

(declare-datatypes ((tuple2!12952 0))(
  ( (tuple2!12953 (_1!6822 BitStream!5234) (_2!6822 array!6600)) )
))
(declare-fun lt!224674 () tuple2!12952)

(declare-fun lt!224676 () tuple2!12948)

(assert (=> b!144987 (= res!121190 (or (not (= (size!2988 (_2!6822 lt!224674)) (size!2988 arr!237))) (not (= (_1!6822 lt!224674) (_2!6820 lt!224676)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5234 array!6600 (_ BitVec 32) (_ BitVec 32)) tuple2!12952)

(assert (=> b!144987 (= lt!224674 (readByteArrayLoopPure!0 (_1!6820 lt!224676) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!144987 (validate_offset_bits!1 ((_ sign_extend 32) (size!2988 (buf!3427 (_2!6819 lt!224669)))) ((_ sign_extend 32) (currentByte!6317 (_2!6819 lt!224664))) ((_ sign_extend 32) (currentBit!6312 (_2!6819 lt!224664))) lt!224661)))

(declare-fun lt!224662 () Unit!9049)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5234 array!6600 (_ BitVec 64)) Unit!9049)

(assert (=> b!144987 (= lt!224662 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6819 lt!224664) (buf!3427 (_2!6819 lt!224669)) lt!224661))))

(assert (=> b!144987 (= lt!224676 (reader!0 (_2!6819 lt!224664) (_2!6819 lt!224669)))))

(declare-fun b!144988 () Bool)

(declare-fun res!121186 () Bool)

(assert (=> b!144988 (=> (not res!121186) (not e!96636))))

(assert (=> b!144988 (= res!121186 (isPrefixOf!0 thiss!1634 (_2!6819 lt!224664)))))

(declare-fun b!144989 () Bool)

(declare-fun res!121191 () Bool)

(assert (=> b!144989 (=> (not res!121191) (not e!96639))))

(assert (=> b!144989 (= res!121191 (isPrefixOf!0 (_2!6819 lt!224664) (_2!6819 lt!224669)))))

(declare-fun lt!224672 () tuple2!12948)

(declare-fun b!144990 () Bool)

(declare-fun lt!224673 () tuple2!12950)

(assert (=> b!144990 (= e!96636 (and (= (_2!6821 lt!224673) (select (arr!3721 arr!237) from!447)) (= (_1!6821 lt!224673) (_2!6820 lt!224672))))))

(assert (=> b!144990 (= lt!224673 (readBytePure!0 (_1!6820 lt!224672)))))

(assert (=> b!144990 (= lt!224672 (reader!0 thiss!1634 (_2!6819 lt!224664)))))

(declare-fun b!144991 () Bool)

(assert (=> b!144991 (= e!96641 (= (_1!6822 (readByteArrayLoopPure!0 (_1!6820 lt!224666) arr!237 from!447 to!404)) (_2!6820 lt!224666)))))

(declare-fun b!144992 () Bool)

(assert (=> b!144992 (= e!96635 (invariant!0 (currentBit!6312 thiss!1634) (currentByte!6317 thiss!1634) (size!2988 (buf!3427 (_2!6819 lt!224664)))))))

(declare-fun b!144993 () Bool)

(declare-fun arrayRangesEq!304 (array!6600 array!6600 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!144993 (= e!96642 (not (arrayRangesEq!304 arr!237 (_2!6822 lt!224674) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!144994 () Bool)

(assert (=> b!144994 (= e!96638 (= (_2!6821 lt!224675) (_2!6821 lt!224668)))))

(assert (= (and start!28008 res!121188) b!144980))

(assert (= (and b!144980 res!121185) b!144986))

(assert (= (and b!144986 res!121192) b!144981))

(assert (= (and b!144981 res!121197) b!144982))

(assert (= (and b!144982 res!121189) b!144985))

(assert (= (and b!144985 res!121195) b!144988))

(assert (= (and b!144988 res!121186) b!144990))

(assert (= (and b!144982 res!121187) b!144984))

(assert (= (and b!144984 res!121193) b!144989))

(assert (= (and b!144989 res!121191) b!144987))

(assert (= (and b!144987 (not res!121190)) b!144993))

(assert (= (and b!144982 res!121194) b!144992))

(assert (= (and b!144982 res!121196) b!144994))

(assert (= (and b!144982 res!121198) b!144991))

(assert (= start!28008 b!144983))

(declare-fun m!222991 () Bool)

(assert (=> b!144988 m!222991))

(declare-fun m!222993 () Bool)

(assert (=> b!144982 m!222993))

(declare-fun m!222995 () Bool)

(assert (=> b!144982 m!222995))

(declare-fun m!222997 () Bool)

(assert (=> b!144982 m!222997))

(declare-fun m!222999 () Bool)

(assert (=> b!144982 m!222999))

(declare-fun m!223001 () Bool)

(assert (=> b!144982 m!223001))

(declare-fun m!223003 () Bool)

(assert (=> b!144982 m!223003))

(declare-fun m!223005 () Bool)

(assert (=> b!144982 m!223005))

(declare-fun m!223007 () Bool)

(assert (=> b!144982 m!223007))

(declare-fun m!223009 () Bool)

(assert (=> b!144982 m!223009))

(declare-fun m!223011 () Bool)

(assert (=> b!144982 m!223011))

(declare-fun m!223013 () Bool)

(assert (=> b!144982 m!223013))

(declare-fun m!223015 () Bool)

(assert (=> b!144982 m!223015))

(declare-fun m!223017 () Bool)

(assert (=> b!144982 m!223017))

(declare-fun m!223019 () Bool)

(assert (=> b!144982 m!223019))

(declare-fun m!223021 () Bool)

(assert (=> b!144982 m!223021))

(declare-fun m!223023 () Bool)

(assert (=> b!144982 m!223023))

(assert (=> b!144982 m!223015))

(declare-fun m!223025 () Bool)

(assert (=> b!144982 m!223025))

(declare-fun m!223027 () Bool)

(assert (=> b!144989 m!223027))

(declare-fun m!223029 () Bool)

(assert (=> b!144987 m!223029))

(declare-fun m!223031 () Bool)

(assert (=> b!144987 m!223031))

(declare-fun m!223033 () Bool)

(assert (=> b!144987 m!223033))

(assert (=> b!144987 m!223005))

(declare-fun m!223035 () Bool)

(assert (=> b!144991 m!223035))

(declare-fun m!223037 () Bool)

(assert (=> start!28008 m!223037))

(declare-fun m!223039 () Bool)

(assert (=> start!28008 m!223039))

(declare-fun m!223041 () Bool)

(assert (=> b!144984 m!223041))

(declare-fun m!223043 () Bool)

(assert (=> b!144984 m!223043))

(declare-fun m!223045 () Bool)

(assert (=> b!144993 m!223045))

(assert (=> b!144990 m!223015))

(declare-fun m!223047 () Bool)

(assert (=> b!144990 m!223047))

(declare-fun m!223049 () Bool)

(assert (=> b!144990 m!223049))

(declare-fun m!223051 () Bool)

(assert (=> b!144983 m!223051))

(assert (=> b!144985 m!223043))

(declare-fun m!223053 () Bool)

(assert (=> b!144985 m!223053))

(declare-fun m!223055 () Bool)

(assert (=> b!144981 m!223055))

(declare-fun m!223057 () Bool)

(assert (=> b!144980 m!223057))

(declare-fun m!223059 () Bool)

(assert (=> b!144992 m!223059))

(push 1)

