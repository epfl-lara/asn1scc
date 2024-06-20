; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26980 () Bool)

(assert start!26980)

(declare-fun res!115797 () Bool)

(declare-fun e!92412 () Bool)

(assert (=> start!26980 (=> (not res!115797) (not e!92412))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6296 0))(
  ( (array!6297 (arr!3544 (Array (_ BitVec 32) (_ BitVec 8))) (size!2849 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6296)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!26980 (= res!115797 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2849 arr!237))))))

(assert (=> start!26980 e!92412))

(assert (=> start!26980 true))

(declare-fun array_inv!2638 (array!6296) Bool)

(assert (=> start!26980 (array_inv!2638 arr!237)))

(declare-datatypes ((BitStream!4962 0))(
  ( (BitStream!4963 (buf!3262 array!6296) (currentByte!6086 (_ BitVec 32)) (currentBit!6081 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4962)

(declare-fun e!92413 () Bool)

(declare-fun inv!12 (BitStream!4962) Bool)

(assert (=> start!26980 (and (inv!12 thiss!1634) e!92413)))

(declare-fun b!138900 () Bool)

(assert (=> b!138900 (= e!92413 (array_inv!2638 (buf!3262 thiss!1634)))))

(declare-fun b!138899 () Bool)

(assert (=> b!138899 (= e!92412 (not true))))

(declare-fun lt!216695 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!138899 (= lt!216695 (bitIndex!0 (size!2849 (buf!3262 thiss!1634)) (currentByte!6086 thiss!1634) (currentBit!6081 thiss!1634)))))

(declare-fun isPrefixOf!0 (BitStream!4962 BitStream!4962) Bool)

(assert (=> b!138899 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!8654 0))(
  ( (Unit!8655) )
))
(declare-fun lt!216696 () Unit!8654)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4962) Unit!8654)

(assert (=> b!138899 (= lt!216696 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun b!138898 () Bool)

(declare-fun res!115795 () Bool)

(assert (=> b!138898 (=> (not res!115795) (not e!92412))))

(assert (=> b!138898 (= res!115795 (bvsge from!447 to!404))))

(declare-fun b!138897 () Bool)

(declare-fun res!115796 () Bool)

(assert (=> b!138897 (=> (not res!115796) (not e!92412))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!138897 (= res!115796 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2849 (buf!3262 thiss!1634))) ((_ sign_extend 32) (currentByte!6086 thiss!1634)) ((_ sign_extend 32) (currentBit!6081 thiss!1634)) (bvsub to!404 from!447)))))

(assert (= (and start!26980 res!115797) b!138897))

(assert (= (and b!138897 res!115796) b!138898))

(assert (= (and b!138898 res!115795) b!138899))

(assert (= start!26980 b!138900))

(declare-fun m!213813 () Bool)

(assert (=> start!26980 m!213813))

(declare-fun m!213815 () Bool)

(assert (=> start!26980 m!213815))

(declare-fun m!213817 () Bool)

(assert (=> b!138900 m!213817))

(declare-fun m!213819 () Bool)

(assert (=> b!138899 m!213819))

(declare-fun m!213821 () Bool)

(assert (=> b!138899 m!213821))

(declare-fun m!213823 () Bool)

(assert (=> b!138899 m!213823))

(declare-fun m!213825 () Bool)

(assert (=> b!138897 m!213825))

(check-sat (not start!26980) (not b!138899) (not b!138897) (not b!138900))
