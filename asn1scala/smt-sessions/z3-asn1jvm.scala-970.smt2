; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27356 () Bool)

(assert start!27356)

(declare-fun res!117100 () Bool)

(declare-fun e!93609 () Bool)

(assert (=> start!27356 (=> (not res!117100) (not e!93609))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6422 0))(
  ( (array!6423 (arr!3613 (Array (_ BitVec 32) (_ BitVec 8))) (size!2906 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6422)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!27356 (= res!117100 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2906 arr!237))))))

(assert (=> start!27356 e!93609))

(assert (=> start!27356 true))

(declare-fun array_inv!2695 (array!6422) Bool)

(assert (=> start!27356 (array_inv!2695 arr!237)))

(declare-datatypes ((BitStream!5070 0))(
  ( (BitStream!5071 (buf!3327 array!6422) (currentByte!6178 (_ BitVec 32)) (currentBit!6173 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5070)

(declare-fun e!93607 () Bool)

(declare-fun inv!12 (BitStream!5070) Bool)

(assert (=> start!27356 (and (inv!12 thiss!1634) e!93607)))

(declare-fun b!140449 () Bool)

(declare-fun res!117103 () Bool)

(assert (=> b!140449 (=> (not res!117103) (not e!93609))))

(assert (=> b!140449 (= res!117103 (bvslt from!447 to!404))))

(declare-datatypes ((tuple2!12310 0))(
  ( (tuple2!12311 (_1!6485 BitStream!5070) (_2!6485 (_ BitVec 8))) )
))
(declare-fun lt!218734 () tuple2!12310)

(declare-fun e!93605 () Bool)

(declare-datatypes ((tuple2!12312 0))(
  ( (tuple2!12313 (_1!6486 BitStream!5070) (_2!6486 BitStream!5070)) )
))
(declare-fun lt!218735 () tuple2!12312)

(declare-fun b!140450 () Bool)

(assert (=> b!140450 (= e!93605 (and (= (_2!6485 lt!218734) (select (arr!3613 arr!237) from!447)) (= (_1!6485 lt!218734) (_2!6486 lt!218735))))))

(declare-fun readBytePure!0 (BitStream!5070) tuple2!12310)

(assert (=> b!140450 (= lt!218734 (readBytePure!0 (_1!6486 lt!218735)))))

(declare-datatypes ((Unit!8791 0))(
  ( (Unit!8792) )
))
(declare-datatypes ((tuple2!12314 0))(
  ( (tuple2!12315 (_1!6487 Unit!8791) (_2!6487 BitStream!5070)) )
))
(declare-fun lt!218733 () tuple2!12314)

(declare-fun reader!0 (BitStream!5070 BitStream!5070) tuple2!12312)

(assert (=> b!140450 (= lt!218735 (reader!0 thiss!1634 (_2!6487 lt!218733)))))

(declare-fun b!140451 () Bool)

(assert (=> b!140451 (= e!93607 (array_inv!2695 (buf!3327 thiss!1634)))))

(declare-fun b!140452 () Bool)

(declare-fun res!117104 () Bool)

(assert (=> b!140452 (=> (not res!117104) (not e!93605))))

(declare-fun isPrefixOf!0 (BitStream!5070 BitStream!5070) Bool)

(assert (=> b!140452 (= res!117104 (isPrefixOf!0 thiss!1634 (_2!6487 lt!218733)))))

(declare-fun b!140453 () Bool)

(declare-fun res!117101 () Bool)

(assert (=> b!140453 (=> (not res!117101) (not e!93609))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!140453 (= res!117101 (invariant!0 (currentBit!6173 thiss!1634) (currentByte!6178 thiss!1634) (size!2906 (buf!3327 thiss!1634))))))

(declare-fun b!140454 () Bool)

(assert (=> b!140454 (= e!93609 (not true))))

(assert (=> b!140454 e!93605))

(declare-fun res!117106 () Bool)

(assert (=> b!140454 (=> (not res!117106) (not e!93605))))

(assert (=> b!140454 (= res!117106 (= (size!2906 (buf!3327 thiss!1634)) (size!2906 (buf!3327 (_2!6487 lt!218733)))))))

(declare-fun appendByte!0 (BitStream!5070 (_ BitVec 8)) tuple2!12314)

(assert (=> b!140454 (= lt!218733 (appendByte!0 thiss!1634 (select (arr!3613 arr!237) from!447)))))

(declare-fun b!140455 () Bool)

(declare-fun res!117102 () Bool)

(assert (=> b!140455 (=> (not res!117102) (not e!93609))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!140455 (= res!117102 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2906 (buf!3327 thiss!1634))) ((_ sign_extend 32) (currentByte!6178 thiss!1634)) ((_ sign_extend 32) (currentBit!6173 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!140456 () Bool)

(declare-fun res!117105 () Bool)

(assert (=> b!140456 (=> (not res!117105) (not e!93605))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!140456 (= res!117105 (= (bitIndex!0 (size!2906 (buf!3327 (_2!6487 lt!218733))) (currentByte!6178 (_2!6487 lt!218733)) (currentBit!6173 (_2!6487 lt!218733))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2906 (buf!3327 thiss!1634)) (currentByte!6178 thiss!1634) (currentBit!6173 thiss!1634)))))))

(assert (= (and start!27356 res!117100) b!140455))

(assert (= (and b!140455 res!117102) b!140449))

(assert (= (and b!140449 res!117103) b!140453))

(assert (= (and b!140453 res!117101) b!140454))

(assert (= (and b!140454 res!117106) b!140456))

(assert (= (and b!140456 res!117105) b!140452))

(assert (= (and b!140452 res!117104) b!140450))

(assert (= start!27356 b!140451))

(declare-fun m!216233 () Bool)

(assert (=> b!140450 m!216233))

(declare-fun m!216235 () Bool)

(assert (=> b!140450 m!216235))

(declare-fun m!216237 () Bool)

(assert (=> b!140450 m!216237))

(declare-fun m!216239 () Bool)

(assert (=> b!140453 m!216239))

(declare-fun m!216241 () Bool)

(assert (=> b!140452 m!216241))

(declare-fun m!216243 () Bool)

(assert (=> b!140455 m!216243))

(assert (=> b!140454 m!216233))

(assert (=> b!140454 m!216233))

(declare-fun m!216245 () Bool)

(assert (=> b!140454 m!216245))

(declare-fun m!216247 () Bool)

(assert (=> b!140451 m!216247))

(declare-fun m!216249 () Bool)

(assert (=> b!140456 m!216249))

(declare-fun m!216251 () Bool)

(assert (=> b!140456 m!216251))

(declare-fun m!216253 () Bool)

(assert (=> start!27356 m!216253))

(declare-fun m!216255 () Bool)

(assert (=> start!27356 m!216255))

(check-sat (not b!140450) (not b!140453) (not b!140455) (not b!140456) (not start!27356) (not b!140452) (not b!140454) (not b!140451))
