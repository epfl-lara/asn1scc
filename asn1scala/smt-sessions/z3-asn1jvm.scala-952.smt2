; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26986 () Bool)

(assert start!26986)

(declare-fun b!138938 () Bool)

(declare-fun e!92454 () Bool)

(declare-fun e!92456 () Bool)

(assert (=> b!138938 (= e!92454 (not e!92456))))

(declare-fun res!115828 () Bool)

(assert (=> b!138938 (=> res!115828 e!92456)))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun lt!216719 () (_ BitVec 64))

(assert (=> b!138938 (= res!115828 (not (= lt!216719 (bvadd lt!216719 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!404 from!447)))))))))

(declare-datatypes ((array!6302 0))(
  ( (array!6303 (arr!3547 (Array (_ BitVec 32) (_ BitVec 8))) (size!2852 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4968 0))(
  ( (BitStream!4969 (buf!3265 array!6302) (currentByte!6089 (_ BitVec 32)) (currentBit!6084 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4968)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!138938 (= lt!216719 (bitIndex!0 (size!2852 (buf!3265 thiss!1634)) (currentByte!6089 thiss!1634) (currentBit!6084 thiss!1634)))))

(declare-fun isPrefixOf!0 (BitStream!4968 BitStream!4968) Bool)

(assert (=> b!138938 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!8660 0))(
  ( (Unit!8661) )
))
(declare-fun lt!216720 () Unit!8660)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4968) Unit!8660)

(assert (=> b!138938 (= lt!216720 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun b!138939 () Bool)

(assert (=> b!138939 (= e!92456 true)))

(declare-datatypes ((tuple2!12154 0))(
  ( (tuple2!12155 (_1!6403 BitStream!4968) (_2!6403 BitStream!4968)) )
))
(declare-fun lt!216718 () tuple2!12154)

(declare-fun reader!0 (BitStream!4968 BitStream!4968) tuple2!12154)

(assert (=> b!138939 (= lt!216718 (reader!0 thiss!1634 thiss!1634))))

(declare-fun b!138940 () Bool)

(declare-fun e!92455 () Bool)

(declare-fun array_inv!2641 (array!6302) Bool)

(assert (=> b!138940 (= e!92455 (array_inv!2641 (buf!3265 thiss!1634)))))

(declare-fun res!115829 () Bool)

(assert (=> start!26986 (=> (not res!115829) (not e!92454))))

(declare-fun arr!237 () array!6302)

(assert (=> start!26986 (= res!115829 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2852 arr!237))))))

(assert (=> start!26986 e!92454))

(assert (=> start!26986 true))

(assert (=> start!26986 (array_inv!2641 arr!237)))

(declare-fun inv!12 (BitStream!4968) Bool)

(assert (=> start!26986 (and (inv!12 thiss!1634) e!92455)))

(declare-fun b!138941 () Bool)

(declare-fun res!115830 () Bool)

(assert (=> b!138941 (=> (not res!115830) (not e!92454))))

(assert (=> b!138941 (= res!115830 (bvsge from!447 to!404))))

(declare-fun b!138942 () Bool)

(declare-fun res!115827 () Bool)

(assert (=> b!138942 (=> (not res!115827) (not e!92454))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!138942 (= res!115827 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2852 (buf!3265 thiss!1634))) ((_ sign_extend 32) (currentByte!6089 thiss!1634)) ((_ sign_extend 32) (currentBit!6084 thiss!1634)) (bvsub to!404 from!447)))))

(assert (= (and start!26986 res!115829) b!138942))

(assert (= (and b!138942 res!115827) b!138941))

(assert (= (and b!138941 res!115830) b!138938))

(assert (= (and b!138938 (not res!115828)) b!138939))

(assert (= start!26986 b!138940))

(declare-fun m!213857 () Bool)

(assert (=> b!138938 m!213857))

(declare-fun m!213859 () Bool)

(assert (=> b!138938 m!213859))

(declare-fun m!213861 () Bool)

(assert (=> b!138938 m!213861))

(declare-fun m!213863 () Bool)

(assert (=> start!26986 m!213863))

(declare-fun m!213865 () Bool)

(assert (=> start!26986 m!213865))

(declare-fun m!213867 () Bool)

(assert (=> b!138942 m!213867))

(declare-fun m!213869 () Bool)

(assert (=> b!138940 m!213869))

(declare-fun m!213871 () Bool)

(assert (=> b!138939 m!213871))

(check-sat (not start!26986) (not b!138939) (not b!138940) (not b!138942) (not b!138938))
