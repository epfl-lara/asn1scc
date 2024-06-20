; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26992 () Bool)

(assert start!26992)

(declare-fun b!138983 () Bool)

(declare-fun e!92500 () Bool)

(declare-fun e!92499 () Bool)

(assert (=> b!138983 (= e!92500 (not e!92499))))

(declare-fun res!115866 () Bool)

(assert (=> b!138983 (=> res!115866 e!92499)))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun lt!216745 () (_ BitVec 64))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!138983 (= res!115866 (not (= lt!216745 (bvadd lt!216745 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!404 from!447)))))))))

(declare-datatypes ((array!6308 0))(
  ( (array!6309 (arr!3550 (Array (_ BitVec 32) (_ BitVec 8))) (size!2855 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4974 0))(
  ( (BitStream!4975 (buf!3268 array!6308) (currentByte!6092 (_ BitVec 32)) (currentBit!6087 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4974)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!138983 (= lt!216745 (bitIndex!0 (size!2855 (buf!3268 thiss!1634)) (currentByte!6092 thiss!1634) (currentBit!6087 thiss!1634)))))

(declare-fun isPrefixOf!0 (BitStream!4974 BitStream!4974) Bool)

(assert (=> b!138983 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!8666 0))(
  ( (Unit!8667) )
))
(declare-fun lt!216746 () Unit!8666)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4974) Unit!8666)

(assert (=> b!138983 (= lt!216746 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun b!138984 () Bool)

(declare-fun res!115864 () Bool)

(assert (=> b!138984 (=> (not res!115864) (not e!92500))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!138984 (= res!115864 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2855 (buf!3268 thiss!1634))) ((_ sign_extend 32) (currentByte!6092 thiss!1634)) ((_ sign_extend 32) (currentBit!6087 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!138985 () Bool)

(declare-fun e!92502 () Bool)

(declare-fun array_inv!2644 (array!6308) Bool)

(assert (=> b!138985 (= e!92502 (array_inv!2644 (buf!3268 thiss!1634)))))

(declare-fun res!115863 () Bool)

(assert (=> start!26992 (=> (not res!115863) (not e!92500))))

(declare-fun arr!237 () array!6308)

(assert (=> start!26992 (= res!115863 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2855 arr!237))))))

(assert (=> start!26992 e!92500))

(assert (=> start!26992 true))

(assert (=> start!26992 (array_inv!2644 arr!237)))

(declare-fun inv!12 (BitStream!4974) Bool)

(assert (=> start!26992 (and (inv!12 thiss!1634) e!92502)))

(declare-fun b!138986 () Bool)

(declare-fun res!115865 () Bool)

(assert (=> b!138986 (=> (not res!115865) (not e!92500))))

(assert (=> b!138986 (= res!115865 (bvsge from!447 to!404))))

(declare-fun b!138987 () Bool)

(assert (=> b!138987 (= e!92499 true)))

(declare-datatypes ((tuple2!12160 0))(
  ( (tuple2!12161 (_1!6406 BitStream!4974) (_2!6406 BitStream!4974)) )
))
(declare-fun lt!216747 () tuple2!12160)

(declare-fun reader!0 (BitStream!4974 BitStream!4974) tuple2!12160)

(assert (=> b!138987 (= lt!216747 (reader!0 thiss!1634 thiss!1634))))

(assert (= (and start!26992 res!115863) b!138984))

(assert (= (and b!138984 res!115864) b!138986))

(assert (= (and b!138986 res!115865) b!138983))

(assert (= (and b!138983 (not res!115866)) b!138987))

(assert (= start!26992 b!138985))

(declare-fun m!213905 () Bool)

(assert (=> b!138983 m!213905))

(declare-fun m!213907 () Bool)

(assert (=> b!138983 m!213907))

(declare-fun m!213909 () Bool)

(assert (=> b!138983 m!213909))

(declare-fun m!213911 () Bool)

(assert (=> b!138984 m!213911))

(declare-fun m!213913 () Bool)

(assert (=> b!138985 m!213913))

(declare-fun m!213915 () Bool)

(assert (=> b!138987 m!213915))

(declare-fun m!213917 () Bool)

(assert (=> start!26992 m!213917))

(declare-fun m!213919 () Bool)

(assert (=> start!26992 m!213919))

(check-sat (not b!138983) (not b!138987) (not start!26992) (not b!138985) (not b!138984))
