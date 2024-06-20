; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27704 () Bool)

(assert start!27704)

(declare-fun res!119079 () Bool)

(declare-fun e!95019 () Bool)

(assert (=> start!27704 (=> (not res!119079) (not e!95019))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6527 0))(
  ( (array!6528 (arr!3673 (Array (_ BitVec 32) (_ BitVec 8))) (size!2954 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6527)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!27704 (= res!119079 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2954 arr!237))))))

(assert (=> start!27704 e!95019))

(assert (=> start!27704 true))

(declare-fun array_inv!2743 (array!6527) Bool)

(assert (=> start!27704 (array_inv!2743 arr!237)))

(declare-datatypes ((BitStream!5166 0))(
  ( (BitStream!5167 (buf!3381 array!6527) (currentByte!6259 (_ BitVec 32)) (currentBit!6254 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5166)

(declare-fun e!95015 () Bool)

(declare-fun inv!12 (BitStream!5166) Bool)

(assert (=> start!27704 (and (inv!12 thiss!1634) e!95015)))

(declare-fun e!95014 () Bool)

(declare-datatypes ((tuple2!12660 0))(
  ( (tuple2!12661 (_1!6669 BitStream!5166) (_2!6669 BitStream!5166)) )
))
(declare-fun lt!221177 () tuple2!12660)

(declare-fun b!142648 () Bool)

(declare-datatypes ((tuple2!12662 0))(
  ( (tuple2!12663 (_1!6670 BitStream!5166) (_2!6670 (_ BitVec 8))) )
))
(declare-fun lt!221178 () tuple2!12662)

(assert (=> b!142648 (= e!95014 (and (= (_2!6670 lt!221178) (select (arr!3673 arr!237) from!447)) (= (_1!6670 lt!221178) (_2!6669 lt!221177))))))

(declare-fun readBytePure!0 (BitStream!5166) tuple2!12662)

(assert (=> b!142648 (= lt!221178 (readBytePure!0 (_1!6669 lt!221177)))))

(declare-datatypes ((Unit!8902 0))(
  ( (Unit!8903) )
))
(declare-datatypes ((tuple2!12664 0))(
  ( (tuple2!12665 (_1!6671 Unit!8902) (_2!6671 BitStream!5166)) )
))
(declare-fun lt!221179 () tuple2!12664)

(declare-fun reader!0 (BitStream!5166 BitStream!5166) tuple2!12660)

(assert (=> b!142648 (= lt!221177 (reader!0 thiss!1634 (_2!6671 lt!221179)))))

(declare-fun b!142649 () Bool)

(declare-fun res!119076 () Bool)

(assert (=> b!142649 (=> (not res!119076) (not e!95014))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!142649 (= res!119076 (= (bitIndex!0 (size!2954 (buf!3381 (_2!6671 lt!221179))) (currentByte!6259 (_2!6671 lt!221179)) (currentBit!6254 (_2!6671 lt!221179))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2954 (buf!3381 thiss!1634)) (currentByte!6259 thiss!1634) (currentBit!6254 thiss!1634)))))))

(declare-fun b!142650 () Bool)

(declare-fun res!119074 () Bool)

(declare-fun e!95011 () Bool)

(assert (=> b!142650 (=> (not res!119074) (not e!95011))))

(declare-fun lt!221187 () tuple2!12664)

(declare-fun isPrefixOf!0 (BitStream!5166 BitStream!5166) Bool)

(assert (=> b!142650 (= res!119074 (isPrefixOf!0 (_2!6671 lt!221179) (_2!6671 lt!221187)))))

(declare-fun b!142651 () Bool)

(declare-fun e!95013 () Bool)

(declare-fun lt!221188 () tuple2!12662)

(declare-fun lt!221189 () tuple2!12662)

(assert (=> b!142651 (= e!95013 (= (_2!6670 lt!221188) (_2!6670 lt!221189)))))

(declare-fun b!142652 () Bool)

(declare-fun res!119077 () Bool)

(assert (=> b!142652 (=> (not res!119077) (not e!95019))))

(assert (=> b!142652 (= res!119077 (bvslt from!447 to!404))))

(declare-fun b!142653 () Bool)

(assert (=> b!142653 (= e!95015 (array_inv!2743 (buf!3381 thiss!1634)))))

(declare-fun b!142654 () Bool)

(declare-fun res!119082 () Bool)

(assert (=> b!142654 (=> (not res!119082) (not e!95019))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!142654 (= res!119082 (invariant!0 (currentBit!6254 thiss!1634) (currentByte!6259 thiss!1634) (size!2954 (buf!3381 thiss!1634))))))

(declare-datatypes ((tuple2!12666 0))(
  ( (tuple2!12667 (_1!6672 BitStream!5166) (_2!6672 array!6527)) )
))
(declare-fun lt!221186 () tuple2!12666)

(declare-fun b!142655 () Bool)

(declare-fun e!95012 () Bool)

(declare-fun arrayRangesEq!270 (array!6527 array!6527 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!142655 (= e!95012 (not (arrayRangesEq!270 arr!237 (_2!6672 lt!221186) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!142656 () Bool)

(assert (=> b!142656 (= e!95011 (not e!95012))))

(declare-fun res!119073 () Bool)

(assert (=> b!142656 (=> res!119073 e!95012)))

(declare-fun lt!221173 () tuple2!12660)

(assert (=> b!142656 (= res!119073 (or (not (= (size!2954 (_2!6672 lt!221186)) (size!2954 arr!237))) (not (= (_1!6672 lt!221186) (_2!6669 lt!221173)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5166 array!6527 (_ BitVec 32) (_ BitVec 32)) tuple2!12666)

(assert (=> b!142656 (= lt!221186 (readByteArrayLoopPure!0 (_1!6669 lt!221173) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!221176 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!142656 (validate_offset_bits!1 ((_ sign_extend 32) (size!2954 (buf!3381 (_2!6671 lt!221187)))) ((_ sign_extend 32) (currentByte!6259 (_2!6671 lt!221179))) ((_ sign_extend 32) (currentBit!6254 (_2!6671 lt!221179))) lt!221176)))

(declare-fun lt!221184 () Unit!8902)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5166 array!6527 (_ BitVec 64)) Unit!8902)

(assert (=> b!142656 (= lt!221184 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6671 lt!221179) (buf!3381 (_2!6671 lt!221187)) lt!221176))))

(assert (=> b!142656 (= lt!221173 (reader!0 (_2!6671 lt!221179) (_2!6671 lt!221187)))))

(declare-fun b!142657 () Bool)

(declare-fun res!119081 () Bool)

(assert (=> b!142657 (=> (not res!119081) (not e!95014))))

(assert (=> b!142657 (= res!119081 (isPrefixOf!0 thiss!1634 (_2!6671 lt!221179)))))

(declare-fun b!142658 () Bool)

(declare-fun e!95017 () Bool)

(assert (=> b!142658 (= e!95017 (invariant!0 (currentBit!6254 thiss!1634) (currentByte!6259 thiss!1634) (size!2954 (buf!3381 (_2!6671 lt!221179)))))))

(declare-fun b!142659 () Bool)

(declare-fun e!95010 () Bool)

(assert (=> b!142659 (= e!95010 e!95011)))

(declare-fun res!119078 () Bool)

(assert (=> b!142659 (=> (not res!119078) (not e!95011))))

(assert (=> b!142659 (= res!119078 (= (bitIndex!0 (size!2954 (buf!3381 (_2!6671 lt!221187))) (currentByte!6259 (_2!6671 lt!221187)) (currentBit!6254 (_2!6671 lt!221187))) (bvadd (bitIndex!0 (size!2954 (buf!3381 (_2!6671 lt!221179))) (currentByte!6259 (_2!6671 lt!221179)) (currentBit!6254 (_2!6671 lt!221179))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!221176))))))

(assert (=> b!142659 (= lt!221176 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!142660 () Bool)

(declare-fun res!119072 () Bool)

(assert (=> b!142660 (=> (not res!119072) (not e!95019))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!142660 (= res!119072 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2954 (buf!3381 thiss!1634))) ((_ sign_extend 32) (currentByte!6259 thiss!1634)) ((_ sign_extend 32) (currentBit!6254 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!142661 () Bool)

(assert (=> b!142661 (= e!95019 (not (bvslt from!447 (size!2954 arr!237))))))

(declare-fun lt!221180 () tuple2!12662)

(declare-fun lt!221183 () tuple2!12660)

(assert (=> b!142661 (= lt!221180 (readBytePure!0 (_1!6669 lt!221183)))))

(declare-fun lt!221174 () tuple2!12660)

(assert (=> b!142661 (= lt!221174 (reader!0 (_2!6671 lt!221179) (_2!6671 lt!221187)))))

(assert (=> b!142661 (= lt!221183 (reader!0 thiss!1634 (_2!6671 lt!221187)))))

(assert (=> b!142661 e!95013))

(declare-fun res!119071 () Bool)

(assert (=> b!142661 (=> (not res!119071) (not e!95013))))

(assert (=> b!142661 (= res!119071 (= (bitIndex!0 (size!2954 (buf!3381 (_1!6670 lt!221188))) (currentByte!6259 (_1!6670 lt!221188)) (currentBit!6254 (_1!6670 lt!221188))) (bitIndex!0 (size!2954 (buf!3381 (_1!6670 lt!221189))) (currentByte!6259 (_1!6670 lt!221189)) (currentBit!6254 (_1!6670 lt!221189)))))))

(declare-fun lt!221175 () Unit!8902)

(declare-fun lt!221182 () BitStream!5166)

(declare-fun readBytePrefixLemma!0 (BitStream!5166 BitStream!5166) Unit!8902)

(assert (=> b!142661 (= lt!221175 (readBytePrefixLemma!0 lt!221182 (_2!6671 lt!221187)))))

(assert (=> b!142661 (= lt!221189 (readBytePure!0 (BitStream!5167 (buf!3381 (_2!6671 lt!221187)) (currentByte!6259 thiss!1634) (currentBit!6254 thiss!1634))))))

(assert (=> b!142661 (= lt!221188 (readBytePure!0 lt!221182))))

(assert (=> b!142661 (= lt!221182 (BitStream!5167 (buf!3381 (_2!6671 lt!221179)) (currentByte!6259 thiss!1634) (currentBit!6254 thiss!1634)))))

(assert (=> b!142661 e!95017))

(declare-fun res!119083 () Bool)

(assert (=> b!142661 (=> (not res!119083) (not e!95017))))

(assert (=> b!142661 (= res!119083 (isPrefixOf!0 thiss!1634 (_2!6671 lt!221187)))))

(declare-fun lt!221181 () Unit!8902)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5166 BitStream!5166 BitStream!5166) Unit!8902)

(assert (=> b!142661 (= lt!221181 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6671 lt!221179) (_2!6671 lt!221187)))))

(assert (=> b!142661 e!95010))

(declare-fun res!119080 () Bool)

(assert (=> b!142661 (=> (not res!119080) (not e!95010))))

(assert (=> b!142661 (= res!119080 (= (size!2954 (buf!3381 (_2!6671 lt!221179))) (size!2954 (buf!3381 (_2!6671 lt!221187)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5166 array!6527 (_ BitVec 32) (_ BitVec 32)) tuple2!12664)

(assert (=> b!142661 (= lt!221187 (appendByteArrayLoop!0 (_2!6671 lt!221179) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!142661 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2954 (buf!3381 (_2!6671 lt!221179)))) ((_ sign_extend 32) (currentByte!6259 (_2!6671 lt!221179))) ((_ sign_extend 32) (currentBit!6254 (_2!6671 lt!221179))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!221185 () Unit!8902)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5166 BitStream!5166 (_ BitVec 64) (_ BitVec 32)) Unit!8902)

(assert (=> b!142661 (= lt!221185 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6671 lt!221179) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!142661 e!95014))

(declare-fun res!119075 () Bool)

(assert (=> b!142661 (=> (not res!119075) (not e!95014))))

(assert (=> b!142661 (= res!119075 (= (size!2954 (buf!3381 thiss!1634)) (size!2954 (buf!3381 (_2!6671 lt!221179)))))))

(declare-fun appendByte!0 (BitStream!5166 (_ BitVec 8)) tuple2!12664)

(assert (=> b!142661 (= lt!221179 (appendByte!0 thiss!1634 (select (arr!3673 arr!237) from!447)))))

(assert (= (and start!27704 res!119079) b!142660))

(assert (= (and b!142660 res!119072) b!142652))

(assert (= (and b!142652 res!119077) b!142654))

(assert (= (and b!142654 res!119082) b!142661))

(assert (= (and b!142661 res!119075) b!142649))

(assert (= (and b!142649 res!119076) b!142657))

(assert (= (and b!142657 res!119081) b!142648))

(assert (= (and b!142661 res!119080) b!142659))

(assert (= (and b!142659 res!119078) b!142650))

(assert (= (and b!142650 res!119074) b!142656))

(assert (= (and b!142656 (not res!119073)) b!142655))

(assert (= (and b!142661 res!119083) b!142658))

(assert (= (and b!142661 res!119071) b!142651))

(assert (= start!27704 b!142653))

(declare-fun m!218961 () Bool)

(assert (=> b!142658 m!218961))

(declare-fun m!218963 () Bool)

(assert (=> b!142659 m!218963))

(declare-fun m!218965 () Bool)

(assert (=> b!142659 m!218965))

(declare-fun m!218967 () Bool)

(assert (=> b!142650 m!218967))

(declare-fun m!218969 () Bool)

(assert (=> b!142648 m!218969))

(declare-fun m!218971 () Bool)

(assert (=> b!142648 m!218971))

(declare-fun m!218973 () Bool)

(assert (=> b!142648 m!218973))

(declare-fun m!218975 () Bool)

(assert (=> b!142660 m!218975))

(declare-fun m!218977 () Bool)

(assert (=> start!27704 m!218977))

(declare-fun m!218979 () Bool)

(assert (=> start!27704 m!218979))

(declare-fun m!218981 () Bool)

(assert (=> b!142656 m!218981))

(declare-fun m!218983 () Bool)

(assert (=> b!142656 m!218983))

(declare-fun m!218985 () Bool)

(assert (=> b!142656 m!218985))

(declare-fun m!218987 () Bool)

(assert (=> b!142656 m!218987))

(declare-fun m!218989 () Bool)

(assert (=> b!142653 m!218989))

(declare-fun m!218991 () Bool)

(assert (=> b!142654 m!218991))

(declare-fun m!218993 () Bool)

(assert (=> b!142655 m!218993))

(declare-fun m!218995 () Bool)

(assert (=> b!142657 m!218995))

(declare-fun m!218997 () Bool)

(assert (=> b!142661 m!218997))

(declare-fun m!218999 () Bool)

(assert (=> b!142661 m!218999))

(declare-fun m!219001 () Bool)

(assert (=> b!142661 m!219001))

(declare-fun m!219003 () Bool)

(assert (=> b!142661 m!219003))

(declare-fun m!219005 () Bool)

(assert (=> b!142661 m!219005))

(declare-fun m!219007 () Bool)

(assert (=> b!142661 m!219007))

(declare-fun m!219009 () Bool)

(assert (=> b!142661 m!219009))

(declare-fun m!219011 () Bool)

(assert (=> b!142661 m!219011))

(assert (=> b!142661 m!218969))

(declare-fun m!219013 () Bool)

(assert (=> b!142661 m!219013))

(declare-fun m!219015 () Bool)

(assert (=> b!142661 m!219015))

(assert (=> b!142661 m!218987))

(declare-fun m!219017 () Bool)

(assert (=> b!142661 m!219017))

(declare-fun m!219019 () Bool)

(assert (=> b!142661 m!219019))

(assert (=> b!142661 m!218969))

(declare-fun m!219021 () Bool)

(assert (=> b!142661 m!219021))

(assert (=> b!142649 m!218965))

(declare-fun m!219023 () Bool)

(assert (=> b!142649 m!219023))

(check-sat (not b!142649) (not b!142661) (not b!142650) (not start!27704) (not b!142653) (not b!142659) (not b!142657) (not b!142656) (not b!142654) (not b!142658) (not b!142660) (not b!142648) (not b!142655))
(check-sat)
