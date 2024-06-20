; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26994 () Bool)

(assert start!26994)

(declare-fun b!138998 () Bool)

(declare-fun e!92515 () Bool)

(declare-datatypes ((array!6310 0))(
  ( (array!6311 (arr!3551 (Array (_ BitVec 32) (_ BitVec 8))) (size!2856 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4976 0))(
  ( (BitStream!4977 (buf!3269 array!6310) (currentByte!6093 (_ BitVec 32)) (currentBit!6088 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4976)

(declare-fun array_inv!2645 (array!6310) Bool)

(assert (=> b!138998 (= e!92515 (array_inv!2645 (buf!3269 thiss!1634)))))

(declare-fun b!138999 () Bool)

(declare-fun res!115875 () Bool)

(declare-fun e!92514 () Bool)

(assert (=> b!138999 (=> (not res!115875) (not e!92514))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!138999 (= res!115875 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2856 (buf!3269 thiss!1634))) ((_ sign_extend 32) (currentByte!6093 thiss!1634)) ((_ sign_extend 32) (currentBit!6088 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!139000 () Bool)

(declare-fun e!92513 () Bool)

(assert (=> b!139000 (= e!92514 (not e!92513))))

(declare-fun res!115877 () Bool)

(assert (=> b!139000 (=> res!115877 e!92513)))

(declare-fun lt!216754 () (_ BitVec 64))

(assert (=> b!139000 (= res!115877 (not (= lt!216754 (bvadd lt!216754 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!404 from!447)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!139000 (= lt!216754 (bitIndex!0 (size!2856 (buf!3269 thiss!1634)) (currentByte!6093 thiss!1634) (currentBit!6088 thiss!1634)))))

(declare-fun isPrefixOf!0 (BitStream!4976 BitStream!4976) Bool)

(assert (=> b!139000 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!8668 0))(
  ( (Unit!8669) )
))
(declare-fun lt!216756 () Unit!8668)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4976) Unit!8668)

(assert (=> b!139000 (= lt!216756 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun b!139001 () Bool)

(declare-fun res!115876 () Bool)

(assert (=> b!139001 (=> (not res!115876) (not e!92514))))

(assert (=> b!139001 (= res!115876 (bvsge from!447 to!404))))

(declare-fun b!139002 () Bool)

(assert (=> b!139002 (= e!92513 true)))

(declare-datatypes ((tuple2!12162 0))(
  ( (tuple2!12163 (_1!6407 BitStream!4976) (_2!6407 BitStream!4976)) )
))
(declare-fun lt!216755 () tuple2!12162)

(declare-fun reader!0 (BitStream!4976 BitStream!4976) tuple2!12162)

(assert (=> b!139002 (= lt!216755 (reader!0 thiss!1634 thiss!1634))))

(declare-fun res!115878 () Bool)

(assert (=> start!26994 (=> (not res!115878) (not e!92514))))

(declare-fun arr!237 () array!6310)

(assert (=> start!26994 (= res!115878 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2856 arr!237))))))

(assert (=> start!26994 e!92514))

(assert (=> start!26994 true))

(assert (=> start!26994 (array_inv!2645 arr!237)))

(declare-fun inv!12 (BitStream!4976) Bool)

(assert (=> start!26994 (and (inv!12 thiss!1634) e!92515)))

(assert (= (and start!26994 res!115878) b!138999))

(assert (= (and b!138999 res!115875) b!139001))

(assert (= (and b!139001 res!115876) b!139000))

(assert (= (and b!139000 (not res!115877)) b!139002))

(assert (= start!26994 b!138998))

(declare-fun m!213921 () Bool)

(assert (=> b!139002 m!213921))

(declare-fun m!213923 () Bool)

(assert (=> b!138999 m!213923))

(declare-fun m!213925 () Bool)

(assert (=> b!138998 m!213925))

(declare-fun m!213927 () Bool)

(assert (=> start!26994 m!213927))

(declare-fun m!213929 () Bool)

(assert (=> start!26994 m!213929))

(declare-fun m!213931 () Bool)

(assert (=> b!139000 m!213931))

(declare-fun m!213933 () Bool)

(assert (=> b!139000 m!213933))

(declare-fun m!213935 () Bool)

(assert (=> b!139000 m!213935))

(push 1)

(assert (not b!139002))

(assert (not b!138998))

(assert (not b!138999))

(assert (not b!139000))

(assert (not start!26994))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

