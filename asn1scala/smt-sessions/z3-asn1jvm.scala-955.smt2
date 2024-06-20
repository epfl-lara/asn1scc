; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27004 () Bool)

(assert start!27004)

(declare-fun b!139073 () Bool)

(declare-fun e!92588 () Bool)

(assert (=> b!139073 (= e!92588 true)))

(declare-datatypes ((array!6320 0))(
  ( (array!6321 (arr!3556 (Array (_ BitVec 32) (_ BitVec 8))) (size!2861 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4986 0))(
  ( (BitStream!4987 (buf!3274 array!6320) (currentByte!6098 (_ BitVec 32)) (currentBit!6093 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4986)

(declare-fun lt!216811 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!139073 (validate_offset_bits!1 ((_ sign_extend 32) (size!2861 (buf!3274 thiss!1634))) ((_ sign_extend 32) (currentByte!6098 thiss!1634)) ((_ sign_extend 32) (currentBit!6093 thiss!1634)) lt!216811)))

(declare-datatypes ((Unit!8678 0))(
  ( (Unit!8679) )
))
(declare-fun lt!216810 () Unit!8678)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4986 array!6320 (_ BitVec 64)) Unit!8678)

(assert (=> b!139073 (= lt!216810 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3274 thiss!1634) lt!216811))))

(declare-datatypes ((tuple2!12172 0))(
  ( (tuple2!12173 (_1!6412 BitStream!4986) (_2!6412 BitStream!4986)) )
))
(declare-fun lt!216812 () tuple2!12172)

(declare-fun reader!0 (BitStream!4986 BitStream!4986) tuple2!12172)

(assert (=> b!139073 (= lt!216812 (reader!0 thiss!1634 thiss!1634))))

(declare-fun b!139074 () Bool)

(declare-fun e!92589 () Bool)

(declare-fun array_inv!2650 (array!6320) Bool)

(assert (=> b!139074 (= e!92589 (array_inv!2650 (buf!3274 thiss!1634)))))

(declare-fun res!115935 () Bool)

(declare-fun e!92592 () Bool)

(assert (=> start!27004 (=> (not res!115935) (not e!92592))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!6320)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!27004 (= res!115935 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2861 arr!237))))))

(assert (=> start!27004 e!92592))

(assert (=> start!27004 true))

(assert (=> start!27004 (array_inv!2650 arr!237)))

(declare-fun inv!12 (BitStream!4986) Bool)

(assert (=> start!27004 (and (inv!12 thiss!1634) e!92589)))

(declare-fun b!139075 () Bool)

(assert (=> b!139075 (= e!92592 (not e!92588))))

(declare-fun res!115937 () Bool)

(assert (=> b!139075 (=> res!115937 e!92588)))

(declare-fun lt!216809 () (_ BitVec 64))

(assert (=> b!139075 (= res!115937 (not (= lt!216809 (bvadd lt!216809 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!216811)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!139075 (= lt!216809 (bitIndex!0 (size!2861 (buf!3274 thiss!1634)) (currentByte!6098 thiss!1634) (currentBit!6093 thiss!1634)))))

(assert (=> b!139075 (= lt!216811 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun isPrefixOf!0 (BitStream!4986 BitStream!4986) Bool)

(assert (=> b!139075 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!216813 () Unit!8678)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4986) Unit!8678)

(assert (=> b!139075 (= lt!216813 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun b!139076 () Bool)

(declare-fun res!115936 () Bool)

(assert (=> b!139076 (=> (not res!115936) (not e!92592))))

(assert (=> b!139076 (= res!115936 (bvsge from!447 to!404))))

(declare-fun b!139077 () Bool)

(declare-fun res!115938 () Bool)

(assert (=> b!139077 (=> (not res!115938) (not e!92592))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!139077 (= res!115938 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2861 (buf!3274 thiss!1634))) ((_ sign_extend 32) (currentByte!6098 thiss!1634)) ((_ sign_extend 32) (currentBit!6093 thiss!1634)) (bvsub to!404 from!447)))))

(assert (= (and start!27004 res!115935) b!139077))

(assert (= (and b!139077 res!115938) b!139076))

(assert (= (and b!139076 res!115936) b!139075))

(assert (= (and b!139075 (not res!115937)) b!139073))

(assert (= start!27004 b!139074))

(declare-fun m!214005 () Bool)

(assert (=> start!27004 m!214005))

(declare-fun m!214007 () Bool)

(assert (=> start!27004 m!214007))

(declare-fun m!214009 () Bool)

(assert (=> b!139075 m!214009))

(declare-fun m!214011 () Bool)

(assert (=> b!139075 m!214011))

(declare-fun m!214013 () Bool)

(assert (=> b!139075 m!214013))

(declare-fun m!214015 () Bool)

(assert (=> b!139077 m!214015))

(declare-fun m!214017 () Bool)

(assert (=> b!139073 m!214017))

(declare-fun m!214019 () Bool)

(assert (=> b!139073 m!214019))

(declare-fun m!214021 () Bool)

(assert (=> b!139073 m!214021))

(declare-fun m!214023 () Bool)

(assert (=> b!139074 m!214023))

(check-sat (not b!139077) (not start!27004) (not b!139075) (not b!139073) (not b!139074))
