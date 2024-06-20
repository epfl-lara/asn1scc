; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!724 () Bool)

(assert start!724)

(declare-fun b!2322 () Bool)

(declare-fun res!4055 () Bool)

(declare-fun e!1648 () Bool)

(assert (=> b!2322 (=> (not res!4055) (not e!1648))))

(declare-datatypes ((array!221 0))(
  ( (array!222 (arr!476 (Array (_ BitVec 32) (_ BitVec 8))) (size!89 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!156 0))(
  ( (BitStream!157 (buf!398 array!221) (currentByte!1353 (_ BitVec 32)) (currentBit!1348 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!132 0))(
  ( (Unit!133) )
))
(declare-datatypes ((tuple2!176 0))(
  ( (tuple2!177 (_1!95 Unit!132) (_2!95 BitStream!156)) )
))
(declare-fun lt!1793 () tuple2!176)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun thiss!1486 () BitStream!156)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!2322 (= res!4055 (= (bitIndex!0 (size!89 (buf!398 (_2!95 lt!1793))) (currentByte!1353 (_2!95 lt!1793)) (currentBit!1348 (_2!95 lt!1793))) (bvadd (bitIndex!0 (size!89 (buf!398 thiss!1486)) (currentByte!1353 thiss!1486) (currentBit!1348 thiss!1486)) nBits!460)))))

(declare-fun b!2323 () Bool)

(declare-fun res!4057 () Bool)

(assert (=> b!2323 (=> (not res!4057) (not e!1648))))

(assert (=> b!2323 (= res!4057 (= (size!89 (buf!398 thiss!1486)) (size!89 (buf!398 (_2!95 lt!1793)))))))

(declare-fun b!2324 () Bool)

(declare-fun res!4052 () Bool)

(declare-fun e!1649 () Bool)

(assert (=> b!2324 (=> (not res!4052) (not e!1649))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!2324 (= res!4052 (validate_offset_bits!1 ((_ sign_extend 32) (size!89 (buf!398 thiss!1486))) ((_ sign_extend 32) (currentByte!1353 thiss!1486)) ((_ sign_extend 32) (currentBit!1348 thiss!1486)) nBits!460))))

(declare-fun b!2325 () Bool)

(declare-fun res!4054 () Bool)

(assert (=> b!2325 (=> (not res!4054) (not e!1648))))

(declare-fun isPrefixOf!0 (BitStream!156 BitStream!156) Bool)

(assert (=> b!2325 (= res!4054 (isPrefixOf!0 thiss!1486 (_2!95 lt!1793)))))

(declare-fun res!4053 () Bool)

(assert (=> start!724 (=> (not res!4053) (not e!1649))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!221)

(assert (=> start!724 (= res!4053 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!89 srcBuffer!6))))))))

(assert (=> start!724 e!1649))

(assert (=> start!724 true))

(declare-fun array_inv!84 (array!221) Bool)

(assert (=> start!724 (array_inv!84 srcBuffer!6)))

(declare-fun e!1647 () Bool)

(declare-fun inv!12 (BitStream!156) Bool)

(assert (=> start!724 (and (inv!12 thiss!1486) e!1647)))

(declare-fun b!2326 () Bool)

(assert (=> b!2326 (= e!1647 (array_inv!84 (buf!398 thiss!1486)))))

(declare-fun b!2327 () Bool)

(assert (=> b!2327 (= e!1649 e!1648)))

(declare-fun res!4056 () Bool)

(assert (=> b!2327 (=> (not res!4056) (not e!1648))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!2327 (= res!4056 (invariant!0 (currentBit!1348 (_2!95 lt!1793)) (currentByte!1353 (_2!95 lt!1793)) (size!89 (buf!398 (_2!95 lt!1793)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!156 array!221 (_ BitVec 64) (_ BitVec 64)) tuple2!176)

(assert (=> b!2327 (= lt!1793 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!2328 () Bool)

(assert (=> b!2328 (= e!1648 false)))

(declare-datatypes ((tuple2!178 0))(
  ( (tuple2!179 (_1!96 BitStream!156) (_2!96 BitStream!156)) )
))
(declare-fun lt!1792 () tuple2!178)

(declare-fun reader!0 (BitStream!156 BitStream!156) tuple2!178)

(assert (=> b!2328 (= lt!1792 (reader!0 thiss!1486 (_2!95 lt!1793)))))

(assert (= (and start!724 res!4053) b!2324))

(assert (= (and b!2324 res!4052) b!2327))

(assert (= (and b!2327 res!4056) b!2323))

(assert (= (and b!2323 res!4057) b!2322))

(assert (= (and b!2322 res!4055) b!2325))

(assert (= (and b!2325 res!4054) b!2328))

(assert (= start!724 b!2326))

(declare-fun m!1955 () Bool)

(assert (=> start!724 m!1955))

(declare-fun m!1957 () Bool)

(assert (=> start!724 m!1957))

(declare-fun m!1959 () Bool)

(assert (=> b!2326 m!1959))

(declare-fun m!1961 () Bool)

(assert (=> b!2324 m!1961))

(declare-fun m!1963 () Bool)

(assert (=> b!2327 m!1963))

(declare-fun m!1965 () Bool)

(assert (=> b!2327 m!1965))

(declare-fun m!1967 () Bool)

(assert (=> b!2325 m!1967))

(declare-fun m!1969 () Bool)

(assert (=> b!2328 m!1969))

(declare-fun m!1971 () Bool)

(assert (=> b!2322 m!1971))

(declare-fun m!1973 () Bool)

(assert (=> b!2322 m!1973))

(check-sat (not start!724) (not b!2327) (not b!2322) (not b!2326) (not b!2324) (not b!2328) (not b!2325))
