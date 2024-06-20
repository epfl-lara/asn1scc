; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47924 () Bool)

(assert start!47924)

(declare-fun b!227961 () Bool)

(declare-fun res!191233 () Bool)

(declare-fun e!156129 () Bool)

(assert (=> b!227961 (=> (not res!191233) (not e!156129))))

(declare-datatypes ((array!11483 0))(
  ( (array!11484 (arr!6019 (Array (_ BitVec 32) (_ BitVec 8))) (size!5038 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9172 0))(
  ( (BitStream!9173 (buf!5579 array!11483) (currentByte!10429 (_ BitVec 32)) (currentBit!10424 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9172)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227961 (= res!191233 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5038 (buf!5579 thiss!1870))) ((_ sign_extend 32) (currentByte!10429 thiss!1870)) ((_ sign_extend 32) (currentBit!10424 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!191231 () Bool)

(assert (=> start!47924 (=> (not res!191231) (not e!156129))))

(declare-fun arr!308 () array!11483)

(assert (=> start!47924 (= res!191231 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5038 arr!308))))))

(assert (=> start!47924 e!156129))

(assert (=> start!47924 true))

(declare-fun array_inv!4779 (array!11483) Bool)

(assert (=> start!47924 (array_inv!4779 arr!308)))

(declare-fun e!156128 () Bool)

(declare-fun inv!12 (BitStream!9172) Bool)

(assert (=> start!47924 (and (inv!12 thiss!1870) e!156128)))

(declare-fun b!227964 () Bool)

(assert (=> b!227964 (= e!156128 (array_inv!4779 (buf!5579 thiss!1870)))))

(declare-fun b!227962 () Bool)

(declare-fun res!191232 () Bool)

(assert (=> b!227962 (=> (not res!191232) (not e!156129))))

(assert (=> b!227962 (= res!191232 (bvslt i!761 to!496))))

(declare-fun b!227963 () Bool)

(assert (=> b!227963 (= e!156129 (not (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand i!761 #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!19622 0))(
  ( (tuple2!19623 (_1!10682 (_ BitVec 8)) (_2!10682 BitStream!9172)) )
))
(declare-fun lt!365160 () tuple2!19622)

(declare-datatypes ((Unit!17083 0))(
  ( (Unit!17084) )
))
(declare-datatypes ((tuple3!1458 0))(
  ( (tuple3!1459 (_1!10683 Unit!17083) (_2!10683 BitStream!9172) (_3!871 array!11483)) )
))
(declare-fun lt!365153 () tuple3!1458)

(assert (=> b!227963 (and (= (_1!10682 lt!365160) (select (arr!6019 (_3!871 lt!365153)) i!761)) (= (select (arr!6019 (_3!871 lt!365153)) i!761) (_1!10682 lt!365160)))))

(declare-fun lt!365157 () array!11483)

(declare-fun lt!365155 () Unit!17083)

(declare-fun arrayRangesEqImpliesEq!130 (array!11483 array!11483 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17083)

(assert (=> b!227963 (= lt!365155 (arrayRangesEqImpliesEq!130 lt!365157 (_3!871 lt!365153) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun arrayRangesEq!874 (array!11483 array!11483 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227963 (arrayRangesEq!874 arr!308 (_3!871 lt!365153) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!365152 () Unit!17083)

(declare-fun arrayRangesEqTransitive!297 (array!11483 array!11483 array!11483 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17083)

(assert (=> b!227963 (= lt!365152 (arrayRangesEqTransitive!297 arr!308 lt!365157 (_3!871 lt!365153) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!227963 (arrayRangesEq!874 arr!308 lt!365157 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!365151 () Unit!17083)

(declare-fun arrayUpdatedAtPrefixLemma!433 (array!11483 (_ BitVec 32) (_ BitVec 8)) Unit!17083)

(assert (=> b!227963 (= lt!365151 (arrayUpdatedAtPrefixLemma!433 arr!308 i!761 (_1!10682 lt!365160)))))

(declare-fun lt!365150 () (_ BitVec 64))

(declare-fun lt!365154 () (_ BitVec 32))

(declare-fun lt!365158 () (_ BitVec 64))

(declare-fun lt!365159 () (_ BitVec 64))

(assert (=> b!227963 (and (= (bvadd lt!365150 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!365154))) lt!365159) (= (bvadd lt!365158 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!365159) (= (buf!5579 thiss!1870) (buf!5579 (_2!10683 lt!365153))) (= (size!5038 arr!308) (size!5038 (_3!871 lt!365153))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227963 (= lt!365159 (bitIndex!0 (size!5038 (buf!5579 (_2!10683 lt!365153))) (currentByte!10429 (_2!10683 lt!365153)) (currentBit!10424 (_2!10683 lt!365153))))))

(assert (=> b!227963 (= lt!365150 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!365158))))

(assert (=> b!227963 (= lt!365150 (bitIndex!0 (size!5038 (buf!5579 (_2!10682 lt!365160))) (currentByte!10429 (_2!10682 lt!365160)) (currentBit!10424 (_2!10682 lt!365160))))))

(assert (=> b!227963 (= lt!365158 (bitIndex!0 (size!5038 (buf!5579 thiss!1870)) (currentByte!10429 thiss!1870) (currentBit!10424 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9172 array!11483 (_ BitVec 32) (_ BitVec 32)) tuple3!1458)

(assert (=> b!227963 (= lt!365153 (readByteArrayLoop!0 (_2!10682 lt!365160) lt!365157 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!227963 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5038 (buf!5579 (_2!10682 lt!365160)))) ((_ sign_extend 32) (currentByte!10429 (_2!10682 lt!365160))) ((_ sign_extend 32) (currentBit!10424 (_2!10682 lt!365160))) lt!365154)))

(assert (=> b!227963 (= lt!365154 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!365156 () Unit!17083)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9172 BitStream!9172 (_ BitVec 64) (_ BitVec 32)) Unit!17083)

(assert (=> b!227963 (= lt!365156 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10682 lt!365160) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227963 (= lt!365157 (array!11484 (store (arr!6019 arr!308) i!761 (_1!10682 lt!365160)) (size!5038 arr!308)))))

(declare-fun readByte!0 (BitStream!9172) tuple2!19622)

(assert (=> b!227963 (= lt!365160 (readByte!0 thiss!1870))))

(assert (= (and start!47924 res!191231) b!227961))

(assert (= (and b!227961 res!191233) b!227962))

(assert (= (and b!227962 res!191232) b!227963))

(assert (= start!47924 b!227964))

(declare-fun m!351031 () Bool)

(assert (=> b!227961 m!351031))

(declare-fun m!351033 () Bool)

(assert (=> start!47924 m!351033))

(declare-fun m!351035 () Bool)

(assert (=> start!47924 m!351035))

(declare-fun m!351037 () Bool)

(assert (=> b!227964 m!351037))

(declare-fun m!351039 () Bool)

(assert (=> b!227963 m!351039))

(declare-fun m!351041 () Bool)

(assert (=> b!227963 m!351041))

(declare-fun m!351043 () Bool)

(assert (=> b!227963 m!351043))

(declare-fun m!351045 () Bool)

(assert (=> b!227963 m!351045))

(declare-fun m!351047 () Bool)

(assert (=> b!227963 m!351047))

(declare-fun m!351049 () Bool)

(assert (=> b!227963 m!351049))

(declare-fun m!351051 () Bool)

(assert (=> b!227963 m!351051))

(declare-fun m!351053 () Bool)

(assert (=> b!227963 m!351053))

(declare-fun m!351055 () Bool)

(assert (=> b!227963 m!351055))

(declare-fun m!351057 () Bool)

(assert (=> b!227963 m!351057))

(declare-fun m!351059 () Bool)

(assert (=> b!227963 m!351059))

(declare-fun m!351061 () Bool)

(assert (=> b!227963 m!351061))

(declare-fun m!351063 () Bool)

(assert (=> b!227963 m!351063))

(declare-fun m!351065 () Bool)

(assert (=> b!227963 m!351065))

(push 1)

(assert (not b!227963))

(assert (not b!227964))

(assert (not start!47924))

(assert (not b!227961))

(check-sat)

(pop 1)

(push 1)

(check-sat)

