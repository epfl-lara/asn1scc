; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26990 () Bool)

(assert start!26990)

(declare-fun b!138968 () Bool)

(declare-fun res!115853 () Bool)

(declare-fun e!92487 () Bool)

(assert (=> b!138968 (=> (not res!115853) (not e!92487))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!138968 (= res!115853 (bvsge from!447 to!404))))

(declare-fun b!138969 () Bool)

(declare-fun res!115851 () Bool)

(assert (=> b!138969 (=> (not res!115851) (not e!92487))))

(declare-datatypes ((array!6306 0))(
  ( (array!6307 (arr!3549 (Array (_ BitVec 32) (_ BitVec 8))) (size!2854 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4972 0))(
  ( (BitStream!4973 (buf!3267 array!6306) (currentByte!6091 (_ BitVec 32)) (currentBit!6086 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4972)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!138969 (= res!115851 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2854 (buf!3267 thiss!1634))) ((_ sign_extend 32) (currentByte!6091 thiss!1634)) ((_ sign_extend 32) (currentBit!6086 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun res!115852 () Bool)

(assert (=> start!26990 (=> (not res!115852) (not e!92487))))

(declare-fun arr!237 () array!6306)

(assert (=> start!26990 (= res!115852 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2854 arr!237))))))

(assert (=> start!26990 e!92487))

(assert (=> start!26990 true))

(declare-fun array_inv!2643 (array!6306) Bool)

(assert (=> start!26990 (array_inv!2643 arr!237)))

(declare-fun e!92485 () Bool)

(declare-fun inv!12 (BitStream!4972) Bool)

(assert (=> start!26990 (and (inv!12 thiss!1634) e!92485)))

(declare-fun b!138970 () Bool)

(declare-fun e!92484 () Bool)

(assert (=> b!138970 (= e!92484 true)))

(declare-datatypes ((tuple2!12158 0))(
  ( (tuple2!12159 (_1!6405 BitStream!4972) (_2!6405 BitStream!4972)) )
))
(declare-fun lt!216738 () tuple2!12158)

(declare-fun reader!0 (BitStream!4972 BitStream!4972) tuple2!12158)

(assert (=> b!138970 (= lt!216738 (reader!0 thiss!1634 thiss!1634))))

(declare-fun b!138971 () Bool)

(assert (=> b!138971 (= e!92485 (array_inv!2643 (buf!3267 thiss!1634)))))

(declare-fun b!138972 () Bool)

(assert (=> b!138972 (= e!92487 (not e!92484))))

(declare-fun res!115854 () Bool)

(assert (=> b!138972 (=> res!115854 e!92484)))

(declare-fun lt!216736 () (_ BitVec 64))

(assert (=> b!138972 (= res!115854 (not (= lt!216736 (bvadd lt!216736 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!404 from!447)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!138972 (= lt!216736 (bitIndex!0 (size!2854 (buf!3267 thiss!1634)) (currentByte!6091 thiss!1634) (currentBit!6086 thiss!1634)))))

(declare-fun isPrefixOf!0 (BitStream!4972 BitStream!4972) Bool)

(assert (=> b!138972 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!8664 0))(
  ( (Unit!8665) )
))
(declare-fun lt!216737 () Unit!8664)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4972) Unit!8664)

(assert (=> b!138972 (= lt!216737 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (= (and start!26990 res!115852) b!138969))

(assert (= (and b!138969 res!115851) b!138968))

(assert (= (and b!138968 res!115853) b!138972))

(assert (= (and b!138972 (not res!115854)) b!138970))

(assert (= start!26990 b!138971))

(declare-fun m!213889 () Bool)

(assert (=> start!26990 m!213889))

(declare-fun m!213891 () Bool)

(assert (=> start!26990 m!213891))

(declare-fun m!213893 () Bool)

(assert (=> b!138969 m!213893))

(declare-fun m!213895 () Bool)

(assert (=> b!138971 m!213895))

(declare-fun m!213897 () Bool)

(assert (=> b!138970 m!213897))

(declare-fun m!213899 () Bool)

(assert (=> b!138972 m!213899))

(declare-fun m!213901 () Bool)

(assert (=> b!138972 m!213901))

(declare-fun m!213903 () Bool)

(assert (=> b!138972 m!213903))

(push 1)

(assert (not b!138971))

(assert (not b!138972))

(assert (not start!26990))

(assert (not b!138970))

(assert (not b!138969))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

