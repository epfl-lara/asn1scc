; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27000 () Bool)

(assert start!27000)

(declare-fun b!139043 () Bool)

(declare-fun e!92559 () Bool)

(assert (=> b!139043 (= e!92559 true)))

(declare-datatypes ((array!6316 0))(
  ( (array!6317 (arr!3554 (Array (_ BitVec 32) (_ BitVec 8))) (size!2859 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4982 0))(
  ( (BitStream!4983 (buf!3272 array!6316) (currentByte!6096 (_ BitVec 32)) (currentBit!6091 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!12168 0))(
  ( (tuple2!12169 (_1!6410 BitStream!4982) (_2!6410 BitStream!4982)) )
))
(declare-fun lt!216782 () tuple2!12168)

(declare-fun thiss!1634 () BitStream!4982)

(declare-fun reader!0 (BitStream!4982 BitStream!4982) tuple2!12168)

(assert (=> b!139043 (= lt!216782 (reader!0 thiss!1634 thiss!1634))))

(declare-fun b!139044 () Bool)

(declare-fun e!92562 () Bool)

(declare-fun array_inv!2648 (array!6316) Bool)

(assert (=> b!139044 (= e!92562 (array_inv!2648 (buf!3272 thiss!1634)))))

(declare-fun b!139045 () Bool)

(declare-fun res!115914 () Bool)

(declare-fun e!92561 () Bool)

(assert (=> b!139045 (=> (not res!115914) (not e!92561))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!139045 (= res!115914 (bvsge from!447 to!404))))

(declare-fun b!139046 () Bool)

(assert (=> b!139046 (= e!92561 (not e!92559))))

(declare-fun res!115913 () Bool)

(assert (=> b!139046 (=> res!115913 e!92559)))

(declare-fun lt!216781 () (_ BitVec 64))

(assert (=> b!139046 (= res!115913 (not (= lt!216781 (bvadd lt!216781 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!404 from!447)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!139046 (= lt!216781 (bitIndex!0 (size!2859 (buf!3272 thiss!1634)) (currentByte!6096 thiss!1634) (currentBit!6091 thiss!1634)))))

(declare-fun isPrefixOf!0 (BitStream!4982 BitStream!4982) Bool)

(assert (=> b!139046 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!8674 0))(
  ( (Unit!8675) )
))
(declare-fun lt!216783 () Unit!8674)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4982) Unit!8674)

(assert (=> b!139046 (= lt!216783 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun res!115911 () Bool)

(assert (=> start!27000 (=> (not res!115911) (not e!92561))))

(declare-fun arr!237 () array!6316)

(assert (=> start!27000 (= res!115911 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2859 arr!237))))))

(assert (=> start!27000 e!92561))

(assert (=> start!27000 true))

(assert (=> start!27000 (array_inv!2648 arr!237)))

(declare-fun inv!12 (BitStream!4982) Bool)

(assert (=> start!27000 (and (inv!12 thiss!1634) e!92562)))

(declare-fun b!139047 () Bool)

(declare-fun res!115912 () Bool)

(assert (=> b!139047 (=> (not res!115912) (not e!92561))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!139047 (= res!115912 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2859 (buf!3272 thiss!1634))) ((_ sign_extend 32) (currentByte!6096 thiss!1634)) ((_ sign_extend 32) (currentBit!6091 thiss!1634)) (bvsub to!404 from!447)))))

(assert (= (and start!27000 res!115911) b!139047))

(assert (= (and b!139047 res!115912) b!139045))

(assert (= (and b!139045 res!115914) b!139046))

(assert (= (and b!139046 (not res!115913)) b!139043))

(assert (= start!27000 b!139044))

(declare-fun m!213969 () Bool)

(assert (=> b!139047 m!213969))

(declare-fun m!213971 () Bool)

(assert (=> b!139046 m!213971))

(declare-fun m!213973 () Bool)

(assert (=> b!139046 m!213973))

(declare-fun m!213975 () Bool)

(assert (=> b!139046 m!213975))

(declare-fun m!213977 () Bool)

(assert (=> b!139044 m!213977))

(declare-fun m!213979 () Bool)

(assert (=> start!27000 m!213979))

(declare-fun m!213981 () Bool)

(assert (=> start!27000 m!213981))

(declare-fun m!213983 () Bool)

(assert (=> b!139043 m!213983))

(push 1)

(assert (not b!139046))

(assert (not b!139043))

(assert (not start!27000))

(assert (not b!139047))

(assert (not b!139044))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

