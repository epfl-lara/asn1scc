; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25446 () Bool)

(assert start!25446)

(declare-fun b!128452 () Bool)

(declare-fun res!106309 () Bool)

(declare-fun e!85147 () Bool)

(assert (=> b!128452 (=> (not res!106309) (not e!85147))))

(declare-datatypes ((array!5931 0))(
  ( (array!5932 (arr!3298 (Array (_ BitVec 32) (_ BitVec 8))) (size!2681 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4626 0))(
  ( (BitStream!4627 (buf!3039 array!5931) (currentByte!5800 (_ BitVec 32)) (currentBit!5795 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!7967 0))(
  ( (Unit!7968) )
))
(declare-datatypes ((tuple2!10852 0))(
  ( (tuple2!10853 (_1!5723 Unit!7967) (_2!5723 BitStream!4626)) )
))
(declare-fun lt!199438 () tuple2!10852)

(declare-fun thiss!1634 () BitStream!4626)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!128452 (= res!106309 (= (bitIndex!0 (size!2681 (buf!3039 (_2!5723 lt!199438))) (currentByte!5800 (_2!5723 lt!199438)) (currentBit!5795 (_2!5723 lt!199438))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2681 (buf!3039 thiss!1634)) (currentByte!5800 thiss!1634) (currentBit!5795 thiss!1634)))))))

(declare-fun b!128453 () Bool)

(declare-fun res!106311 () Bool)

(assert (=> b!128453 (=> (not res!106311) (not e!85147))))

(declare-fun isPrefixOf!0 (BitStream!4626 BitStream!4626) Bool)

(assert (=> b!128453 (= res!106311 (isPrefixOf!0 thiss!1634 (_2!5723 lt!199438)))))

(declare-fun b!128454 () Bool)

(declare-fun e!85149 () Bool)

(declare-fun array_inv!2470 (array!5931) Bool)

(assert (=> b!128454 (= e!85149 (array_inv!2470 (buf!3039 thiss!1634)))))

(declare-fun b!128455 () Bool)

(declare-fun res!106312 () Bool)

(declare-fun e!85150 () Bool)

(assert (=> b!128455 (=> (not res!106312) (not e!85150))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!128455 (= res!106312 (invariant!0 (currentBit!5795 thiss!1634) (currentByte!5800 thiss!1634) (size!2681 (buf!3039 thiss!1634))))))

(declare-datatypes ((tuple2!10854 0))(
  ( (tuple2!10855 (_1!5724 BitStream!4626) (_2!5724 BitStream!4626)) )
))
(declare-fun lt!199439 () tuple2!10854)

(declare-fun b!128456 () Bool)

(declare-datatypes ((tuple2!10856 0))(
  ( (tuple2!10857 (_1!5725 BitStream!4626) (_2!5725 (_ BitVec 8))) )
))
(declare-fun lt!199437 () tuple2!10856)

(declare-fun arr!237 () array!5931)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!128456 (= e!85147 (and (= (_2!5725 lt!199437) (select (arr!3298 arr!237) from!447)) (= (_1!5725 lt!199437) (_2!5724 lt!199439))))))

(declare-fun readBytePure!0 (BitStream!4626) tuple2!10856)

(assert (=> b!128456 (= lt!199437 (readBytePure!0 (_1!5724 lt!199439)))))

(declare-fun reader!0 (BitStream!4626 BitStream!4626) tuple2!10854)

(assert (=> b!128456 (= lt!199439 (reader!0 thiss!1634 (_2!5723 lt!199438)))))

(declare-fun b!128457 () Bool)

(assert (=> b!128457 (= e!85150 (not true))))

(assert (=> b!128457 e!85147))

(declare-fun res!106308 () Bool)

(assert (=> b!128457 (=> (not res!106308) (not e!85147))))

(assert (=> b!128457 (= res!106308 (= (size!2681 (buf!3039 thiss!1634)) (size!2681 (buf!3039 (_2!5723 lt!199438)))))))

(declare-fun appendByte!0 (BitStream!4626 (_ BitVec 8)) tuple2!10852)

(assert (=> b!128457 (= lt!199438 (appendByte!0 thiss!1634 (select (arr!3298 arr!237) from!447)))))

(declare-fun res!106310 () Bool)

(assert (=> start!25446 (=> (not res!106310) (not e!85150))))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> start!25446 (= res!106310 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2681 arr!237))))))

(assert (=> start!25446 e!85150))

(assert (=> start!25446 true))

(assert (=> start!25446 (array_inv!2470 arr!237)))

(declare-fun inv!12 (BitStream!4626) Bool)

(assert (=> start!25446 (and (inv!12 thiss!1634) e!85149)))

(declare-fun b!128458 () Bool)

(declare-fun res!106306 () Bool)

(assert (=> b!128458 (=> (not res!106306) (not e!85150))))

(assert (=> b!128458 (= res!106306 (bvslt from!447 to!404))))

(declare-fun b!128459 () Bool)

(declare-fun res!106307 () Bool)

(assert (=> b!128459 (=> (not res!106307) (not e!85150))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!128459 (= res!106307 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2681 (buf!3039 thiss!1634))) ((_ sign_extend 32) (currentByte!5800 thiss!1634)) ((_ sign_extend 32) (currentBit!5795 thiss!1634)) (bvsub to!404 from!447)))))

(assert (= (and start!25446 res!106310) b!128459))

(assert (= (and b!128459 res!106307) b!128458))

(assert (= (and b!128458 res!106306) b!128455))

(assert (= (and b!128455 res!106312) b!128457))

(assert (= (and b!128457 res!106308) b!128452))

(assert (= (and b!128452 res!106309) b!128453))

(assert (= (and b!128453 res!106311) b!128456))

(assert (= start!25446 b!128454))

(declare-fun m!194245 () Bool)

(assert (=> b!128454 m!194245))

(declare-fun m!194247 () Bool)

(assert (=> b!128456 m!194247))

(declare-fun m!194249 () Bool)

(assert (=> b!128456 m!194249))

(declare-fun m!194251 () Bool)

(assert (=> b!128456 m!194251))

(declare-fun m!194253 () Bool)

(assert (=> b!128453 m!194253))

(declare-fun m!194255 () Bool)

(assert (=> b!128459 m!194255))

(assert (=> b!128457 m!194247))

(assert (=> b!128457 m!194247))

(declare-fun m!194257 () Bool)

(assert (=> b!128457 m!194257))

(declare-fun m!194259 () Bool)

(assert (=> b!128452 m!194259))

(declare-fun m!194261 () Bool)

(assert (=> b!128452 m!194261))

(declare-fun m!194263 () Bool)

(assert (=> start!25446 m!194263))

(declare-fun m!194265 () Bool)

(assert (=> start!25446 m!194265))

(declare-fun m!194267 () Bool)

(assert (=> b!128455 m!194267))

(check-sat (not b!128459) (not b!128457) (not b!128454) (not b!128455) (not b!128452) (not b!128456) (not b!128453) (not start!25446))
