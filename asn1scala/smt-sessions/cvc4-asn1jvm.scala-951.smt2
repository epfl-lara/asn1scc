; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26982 () Bool)

(assert start!26982)

(declare-fun b!138910 () Bool)

(declare-fun res!115806 () Bool)

(declare-fun e!92425 () Bool)

(assert (=> b!138910 (=> (not res!115806) (not e!92425))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!138910 (= res!115806 (bvsge from!447 to!404))))

(declare-fun b!138912 () Bool)

(declare-fun e!92426 () Bool)

(declare-datatypes ((array!6298 0))(
  ( (array!6299 (arr!3545 (Array (_ BitVec 32) (_ BitVec 8))) (size!2850 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4964 0))(
  ( (BitStream!4965 (buf!3263 array!6298) (currentByte!6087 (_ BitVec 32)) (currentBit!6082 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4964)

(declare-fun array_inv!2639 (array!6298) Bool)

(assert (=> b!138912 (= e!92426 (array_inv!2639 (buf!3263 thiss!1634)))))

(declare-fun res!115805 () Bool)

(assert (=> start!26982 (=> (not res!115805) (not e!92425))))

(declare-fun arr!237 () array!6298)

(assert (=> start!26982 (= res!115805 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2850 arr!237))))))

(assert (=> start!26982 e!92425))

(assert (=> start!26982 true))

(assert (=> start!26982 (array_inv!2639 arr!237)))

(declare-fun inv!12 (BitStream!4964) Bool)

(assert (=> start!26982 (and (inv!12 thiss!1634) e!92426)))

(declare-fun b!138909 () Bool)

(declare-fun res!115804 () Bool)

(assert (=> b!138909 (=> (not res!115804) (not e!92425))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!138909 (= res!115804 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2850 (buf!3263 thiss!1634))) ((_ sign_extend 32) (currentByte!6087 thiss!1634)) ((_ sign_extend 32) (currentBit!6082 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!138911 () Bool)

(assert (=> b!138911 (= e!92425 (not true))))

(declare-fun lt!216701 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!138911 (= lt!216701 (bitIndex!0 (size!2850 (buf!3263 thiss!1634)) (currentByte!6087 thiss!1634) (currentBit!6082 thiss!1634)))))

(declare-fun isPrefixOf!0 (BitStream!4964 BitStream!4964) Bool)

(assert (=> b!138911 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!8656 0))(
  ( (Unit!8657) )
))
(declare-fun lt!216702 () Unit!8656)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4964) Unit!8656)

(assert (=> b!138911 (= lt!216702 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (= (and start!26982 res!115805) b!138909))

(assert (= (and b!138909 res!115804) b!138910))

(assert (= (and b!138910 res!115806) b!138911))

(assert (= start!26982 b!138912))

(declare-fun m!213827 () Bool)

(assert (=> b!138912 m!213827))

(declare-fun m!213829 () Bool)

(assert (=> start!26982 m!213829))

(declare-fun m!213831 () Bool)

(assert (=> start!26982 m!213831))

(declare-fun m!213833 () Bool)

(assert (=> b!138909 m!213833))

(declare-fun m!213835 () Bool)

(assert (=> b!138911 m!213835))

(declare-fun m!213837 () Bool)

(assert (=> b!138911 m!213837))

(declare-fun m!213839 () Bool)

(assert (=> b!138911 m!213839))

(push 1)

(assert (not b!138912))

(assert (not start!26982))

(assert (not b!138911))

(assert (not b!138909))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

