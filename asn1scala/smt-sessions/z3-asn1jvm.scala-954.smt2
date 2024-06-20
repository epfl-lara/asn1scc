; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26998 () Bool)

(assert start!26998)

(declare-fun b!139028 () Bool)

(declare-fun e!92543 () Bool)

(assert (=> b!139028 (= e!92543 true)))

(declare-datatypes ((array!6314 0))(
  ( (array!6315 (arr!3553 (Array (_ BitVec 32) (_ BitVec 8))) (size!2858 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4980 0))(
  ( (BitStream!4981 (buf!3271 array!6314) (currentByte!6095 (_ BitVec 32)) (currentBit!6090 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!12166 0))(
  ( (tuple2!12167 (_1!6409 BitStream!4980) (_2!6409 BitStream!4980)) )
))
(declare-fun lt!216772 () tuple2!12166)

(declare-fun thiss!1634 () BitStream!4980)

(declare-fun reader!0 (BitStream!4980 BitStream!4980) tuple2!12166)

(assert (=> b!139028 (= lt!216772 (reader!0 thiss!1634 thiss!1634))))

(declare-fun b!139029 () Bool)

(declare-fun e!92544 () Bool)

(assert (=> b!139029 (= e!92544 (not e!92543))))

(declare-fun res!115900 () Bool)

(assert (=> b!139029 (=> res!115900 e!92543)))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun lt!216774 () (_ BitVec 64))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!139029 (= res!115900 (not (= lt!216774 (bvadd lt!216774 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!404 from!447)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!139029 (= lt!216774 (bitIndex!0 (size!2858 (buf!3271 thiss!1634)) (currentByte!6095 thiss!1634) (currentBit!6090 thiss!1634)))))

(declare-fun isPrefixOf!0 (BitStream!4980 BitStream!4980) Bool)

(assert (=> b!139029 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!8672 0))(
  ( (Unit!8673) )
))
(declare-fun lt!216773 () Unit!8672)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4980) Unit!8672)

(assert (=> b!139029 (= lt!216773 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun b!139030 () Bool)

(declare-fun e!92545 () Bool)

(declare-fun array_inv!2647 (array!6314) Bool)

(assert (=> b!139030 (= e!92545 (array_inv!2647 (buf!3271 thiss!1634)))))

(declare-fun b!139031 () Bool)

(declare-fun res!115901 () Bool)

(assert (=> b!139031 (=> (not res!115901) (not e!92544))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!139031 (= res!115901 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2858 (buf!3271 thiss!1634))) ((_ sign_extend 32) (currentByte!6095 thiss!1634)) ((_ sign_extend 32) (currentBit!6090 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!139032 () Bool)

(declare-fun res!115902 () Bool)

(assert (=> b!139032 (=> (not res!115902) (not e!92544))))

(assert (=> b!139032 (= res!115902 (bvsge from!447 to!404))))

(declare-fun res!115899 () Bool)

(assert (=> start!26998 (=> (not res!115899) (not e!92544))))

(declare-fun arr!237 () array!6314)

(assert (=> start!26998 (= res!115899 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2858 arr!237))))))

(assert (=> start!26998 e!92544))

(assert (=> start!26998 true))

(assert (=> start!26998 (array_inv!2647 arr!237)))

(declare-fun inv!12 (BitStream!4980) Bool)

(assert (=> start!26998 (and (inv!12 thiss!1634) e!92545)))

(assert (= (and start!26998 res!115899) b!139031))

(assert (= (and b!139031 res!115901) b!139032))

(assert (= (and b!139032 res!115902) b!139029))

(assert (= (and b!139029 (not res!115900)) b!139028))

(assert (= start!26998 b!139030))

(declare-fun m!213953 () Bool)

(assert (=> start!26998 m!213953))

(declare-fun m!213955 () Bool)

(assert (=> start!26998 m!213955))

(declare-fun m!213957 () Bool)

(assert (=> b!139029 m!213957))

(declare-fun m!213959 () Bool)

(assert (=> b!139029 m!213959))

(declare-fun m!213961 () Bool)

(assert (=> b!139029 m!213961))

(declare-fun m!213963 () Bool)

(assert (=> b!139028 m!213963))

(declare-fun m!213965 () Bool)

(assert (=> b!139031 m!213965))

(declare-fun m!213967 () Bool)

(assert (=> b!139030 m!213967))

(check-sat (not b!139028) (not b!139029) (not start!26998) (not b!139030) (not b!139031))
