; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26988 () Bool)

(assert start!26988)

(declare-fun b!138953 () Bool)

(declare-fun e!92471 () Bool)

(declare-fun e!92468 () Bool)

(assert (=> b!138953 (= e!92471 (not e!92468))))

(declare-fun res!115842 () Bool)

(assert (=> b!138953 (=> res!115842 e!92468)))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun lt!216728 () (_ BitVec 64))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!138953 (= res!115842 (not (= lt!216728 (bvadd lt!216728 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!404 from!447)))))))))

(declare-datatypes ((array!6304 0))(
  ( (array!6305 (arr!3548 (Array (_ BitVec 32) (_ BitVec 8))) (size!2853 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4970 0))(
  ( (BitStream!4971 (buf!3266 array!6304) (currentByte!6090 (_ BitVec 32)) (currentBit!6085 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4970)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!138953 (= lt!216728 (bitIndex!0 (size!2853 (buf!3266 thiss!1634)) (currentByte!6090 thiss!1634) (currentBit!6085 thiss!1634)))))

(declare-fun isPrefixOf!0 (BitStream!4970 BitStream!4970) Bool)

(assert (=> b!138953 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!8662 0))(
  ( (Unit!8663) )
))
(declare-fun lt!216729 () Unit!8662)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4970) Unit!8662)

(assert (=> b!138953 (= lt!216729 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun b!138954 () Bool)

(declare-fun res!115839 () Bool)

(assert (=> b!138954 (=> (not res!115839) (not e!92471))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!138954 (= res!115839 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2853 (buf!3266 thiss!1634))) ((_ sign_extend 32) (currentByte!6090 thiss!1634)) ((_ sign_extend 32) (currentBit!6085 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!138955 () Bool)

(declare-fun e!92469 () Bool)

(declare-fun array_inv!2642 (array!6304) Bool)

(assert (=> b!138955 (= e!92469 (array_inv!2642 (buf!3266 thiss!1634)))))

(declare-fun b!138956 () Bool)

(declare-fun res!115841 () Bool)

(assert (=> b!138956 (=> (not res!115841) (not e!92471))))

(assert (=> b!138956 (= res!115841 (bvsge from!447 to!404))))

(declare-fun res!115840 () Bool)

(assert (=> start!26988 (=> (not res!115840) (not e!92471))))

(declare-fun arr!237 () array!6304)

(assert (=> start!26988 (= res!115840 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2853 arr!237))))))

(assert (=> start!26988 e!92471))

(assert (=> start!26988 true))

(assert (=> start!26988 (array_inv!2642 arr!237)))

(declare-fun inv!12 (BitStream!4970) Bool)

(assert (=> start!26988 (and (inv!12 thiss!1634) e!92469)))

(declare-fun b!138957 () Bool)

(assert (=> b!138957 (= e!92468 true)))

(declare-datatypes ((tuple2!12156 0))(
  ( (tuple2!12157 (_1!6404 BitStream!4970) (_2!6404 BitStream!4970)) )
))
(declare-fun lt!216727 () tuple2!12156)

(declare-fun reader!0 (BitStream!4970 BitStream!4970) tuple2!12156)

(assert (=> b!138957 (= lt!216727 (reader!0 thiss!1634 thiss!1634))))

(assert (= (and start!26988 res!115840) b!138954))

(assert (= (and b!138954 res!115839) b!138956))

(assert (= (and b!138956 res!115841) b!138953))

(assert (= (and b!138953 (not res!115842)) b!138957))

(assert (= start!26988 b!138955))

(declare-fun m!213873 () Bool)

(assert (=> b!138955 m!213873))

(declare-fun m!213875 () Bool)

(assert (=> b!138954 m!213875))

(declare-fun m!213877 () Bool)

(assert (=> b!138953 m!213877))

(declare-fun m!213879 () Bool)

(assert (=> b!138953 m!213879))

(declare-fun m!213881 () Bool)

(assert (=> b!138953 m!213881))

(declare-fun m!213883 () Bool)

(assert (=> b!138957 m!213883))

(declare-fun m!213885 () Bool)

(assert (=> start!26988 m!213885))

(declare-fun m!213887 () Bool)

(assert (=> start!26988 m!213887))

(push 1)

(assert (not start!26988))

