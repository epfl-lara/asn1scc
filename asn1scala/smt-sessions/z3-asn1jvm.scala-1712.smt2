; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47338 () Bool)

(assert start!47338)

(declare-fun b!225848 () Bool)

(declare-fun res!189520 () Bool)

(declare-fun e!154282 () Bool)

(assert (=> b!225848 (=> (not res!189520) (not e!154282))))

(declare-fun i!761 () (_ BitVec 32))

(declare-datatypes ((array!11266 0))(
  ( (array!11267 (arr!5900 (Array (_ BitVec 32) (_ BitVec 8))) (size!4943 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8982 0))(
  ( (BitStream!8983 (buf!5484 array!11266) (currentByte!10280 (_ BitVec 32)) (currentBit!10275 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8982)

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225848 (= res!189520 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4943 (buf!5484 thiss!1870))) ((_ sign_extend 32) (currentByte!10280 thiss!1870)) ((_ sign_extend 32) (currentBit!10275 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!189521 () Bool)

(assert (=> start!47338 (=> (not res!189521) (not e!154282))))

(declare-fun arr!308 () array!11266)

(assert (=> start!47338 (= res!189521 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4943 arr!308))))))

(assert (=> start!47338 e!154282))

(assert (=> start!47338 true))

(declare-fun array_inv!4684 (array!11266) Bool)

(assert (=> start!47338 (array_inv!4684 arr!308)))

(declare-fun e!154279 () Bool)

(declare-fun inv!12 (BitStream!8982) Bool)

(assert (=> start!47338 (and (inv!12 thiss!1870) e!154279)))

(declare-fun b!225849 () Bool)

(declare-fun e!154278 () Bool)

(assert (=> b!225849 (= e!154278 false)))

(declare-fun lt!358937 () (_ BitVec 64))

(declare-datatypes ((tuple2!19330 0))(
  ( (tuple2!19331 (_1!10452 (_ BitVec 8)) (_2!10452 BitStream!8982)) )
))
(declare-fun lt!358938 () tuple2!19330)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225849 (= lt!358937 (bitIndex!0 (size!4943 (buf!5484 (_2!10452 lt!358938))) (currentByte!10280 (_2!10452 lt!358938)) (currentBit!10275 (_2!10452 lt!358938))))))

(declare-fun b!225850 () Bool)

(assert (=> b!225850 (= e!154282 e!154278)))

(declare-fun res!189522 () Bool)

(assert (=> b!225850 (=> (not res!189522) (not e!154278))))

(assert (=> b!225850 (= res!189522 (= (size!4943 (buf!5484 thiss!1870)) (size!4943 (buf!5484 (_2!10452 lt!358938)))))))

(declare-fun readByte!0 (BitStream!8982) tuple2!19330)

(assert (=> b!225850 (= lt!358938 (readByte!0 thiss!1870))))

(declare-fun b!225851 () Bool)

(declare-fun res!189523 () Bool)

(assert (=> b!225851 (=> (not res!189523) (not e!154282))))

(assert (=> b!225851 (= res!189523 (bvslt i!761 to!496))))

(declare-fun b!225852 () Bool)

(assert (=> b!225852 (= e!154279 (array_inv!4684 (buf!5484 thiss!1870)))))

(assert (= (and start!47338 res!189521) b!225848))

(assert (= (and b!225848 res!189520) b!225851))

(assert (= (and b!225851 res!189523) b!225850))

(assert (= (and b!225850 res!189522) b!225849))

(assert (= start!47338 b!225852))

(declare-fun m!346891 () Bool)

(assert (=> start!47338 m!346891))

(declare-fun m!346893 () Bool)

(assert (=> start!47338 m!346893))

(declare-fun m!346895 () Bool)

(assert (=> b!225848 m!346895))

(declare-fun m!346897 () Bool)

(assert (=> b!225852 m!346897))

(declare-fun m!346899 () Bool)

(assert (=> b!225850 m!346899))

(declare-fun m!346901 () Bool)

(assert (=> b!225849 m!346901))

(check-sat (not b!225848) (not b!225852) (not start!47338) (not b!225850) (not b!225849))
