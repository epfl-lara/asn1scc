; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26978 () Bool)

(assert start!26978)

(declare-fun b!138886 () Bool)

(declare-fun res!115788 () Bool)

(declare-fun e!92401 () Bool)

(assert (=> b!138886 (=> (not res!115788) (not e!92401))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!138886 (= res!115788 (bvsge from!447 to!404))))

(declare-fun b!138888 () Bool)

(declare-fun e!92402 () Bool)

(declare-datatypes ((array!6294 0))(
  ( (array!6295 (arr!3543 (Array (_ BitVec 32) (_ BitVec 8))) (size!2848 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4960 0))(
  ( (BitStream!4961 (buf!3261 array!6294) (currentByte!6085 (_ BitVec 32)) (currentBit!6080 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4960)

(declare-fun array_inv!2637 (array!6294) Bool)

(assert (=> b!138888 (= e!92402 (array_inv!2637 (buf!3261 thiss!1634)))))

(declare-fun res!115787 () Bool)

(assert (=> start!26978 (=> (not res!115787) (not e!92401))))

(declare-fun arr!237 () array!6294)

(assert (=> start!26978 (= res!115787 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2848 arr!237))))))

(assert (=> start!26978 e!92401))

(assert (=> start!26978 true))

(assert (=> start!26978 (array_inv!2637 arr!237)))

(declare-fun inv!12 (BitStream!4960) Bool)

(assert (=> start!26978 (and (inv!12 thiss!1634) e!92402)))

(declare-fun b!138885 () Bool)

(declare-fun res!115786 () Bool)

(assert (=> b!138885 (=> (not res!115786) (not e!92401))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!138885 (= res!115786 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2848 (buf!3261 thiss!1634))) ((_ sign_extend 32) (currentByte!6085 thiss!1634)) ((_ sign_extend 32) (currentBit!6080 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!138887 () Bool)

(assert (=> b!138887 (= e!92401 (not true))))

(declare-fun lt!216690 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!138887 (= lt!216690 (bitIndex!0 (size!2848 (buf!3261 thiss!1634)) (currentByte!6085 thiss!1634) (currentBit!6080 thiss!1634)))))

(declare-fun isPrefixOf!0 (BitStream!4960 BitStream!4960) Bool)

(assert (=> b!138887 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!8652 0))(
  ( (Unit!8653) )
))
(declare-fun lt!216689 () Unit!8652)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4960) Unit!8652)

(assert (=> b!138887 (= lt!216689 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (= (and start!26978 res!115787) b!138885))

(assert (= (and b!138885 res!115786) b!138886))

(assert (= (and b!138886 res!115788) b!138887))

(assert (= start!26978 b!138888))

(declare-fun m!213799 () Bool)

(assert (=> b!138888 m!213799))

(declare-fun m!213801 () Bool)

(assert (=> start!26978 m!213801))

(declare-fun m!213803 () Bool)

(assert (=> start!26978 m!213803))

(declare-fun m!213805 () Bool)

(assert (=> b!138885 m!213805))

(declare-fun m!213807 () Bool)

(assert (=> b!138887 m!213807))

(declare-fun m!213809 () Bool)

(assert (=> b!138887 m!213809))

(declare-fun m!213811 () Bool)

(assert (=> b!138887 m!213811))

(push 1)

(assert (not b!138885))

(assert (not b!138888))

(assert (not b!138887))

(assert (not start!26978))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

