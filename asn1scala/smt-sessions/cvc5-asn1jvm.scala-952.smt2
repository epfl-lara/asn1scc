; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26984 () Bool)

(assert start!26984)

(declare-fun b!138923 () Bool)

(declare-fun e!92440 () Bool)

(assert (=> b!138923 (= e!92440 true)))

(declare-datatypes ((array!6300 0))(
  ( (array!6301 (arr!3546 (Array (_ BitVec 32) (_ BitVec 8))) (size!2851 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4966 0))(
  ( (BitStream!4967 (buf!3264 array!6300) (currentByte!6088 (_ BitVec 32)) (currentBit!6083 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!12152 0))(
  ( (tuple2!12153 (_1!6402 BitStream!4966) (_2!6402 BitStream!4966)) )
))
(declare-fun lt!216710 () tuple2!12152)

(declare-fun thiss!1634 () BitStream!4966)

(declare-fun reader!0 (BitStream!4966 BitStream!4966) tuple2!12152)

(assert (=> b!138923 (= lt!216710 (reader!0 thiss!1634 thiss!1634))))

(declare-fun b!138924 () Bool)

(declare-fun res!115817 () Bool)

(declare-fun e!92439 () Bool)

(assert (=> b!138924 (=> (not res!115817) (not e!92439))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!138924 (= res!115817 (bvsge from!447 to!404))))

(declare-fun b!138925 () Bool)

(declare-fun e!92441 () Bool)

(declare-fun array_inv!2640 (array!6300) Bool)

(assert (=> b!138925 (= e!92441 (array_inv!2640 (buf!3264 thiss!1634)))))

(declare-fun b!138926 () Bool)

(declare-fun res!115818 () Bool)

(assert (=> b!138926 (=> (not res!115818) (not e!92439))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!138926 (= res!115818 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2851 (buf!3264 thiss!1634))) ((_ sign_extend 32) (currentByte!6088 thiss!1634)) ((_ sign_extend 32) (currentBit!6083 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun res!115815 () Bool)

(assert (=> start!26984 (=> (not res!115815) (not e!92439))))

(declare-fun arr!237 () array!6300)

(assert (=> start!26984 (= res!115815 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2851 arr!237))))))

(assert (=> start!26984 e!92439))

(assert (=> start!26984 true))

(assert (=> start!26984 (array_inv!2640 arr!237)))

(declare-fun inv!12 (BitStream!4966) Bool)

(assert (=> start!26984 (and (inv!12 thiss!1634) e!92441)))

(declare-fun b!138927 () Bool)

(assert (=> b!138927 (= e!92439 (not e!92440))))

(declare-fun res!115816 () Bool)

(assert (=> b!138927 (=> res!115816 e!92440)))

(declare-fun lt!216709 () (_ BitVec 64))

(assert (=> b!138927 (= res!115816 (not (= lt!216709 (bvadd lt!216709 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!404 from!447)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!138927 (= lt!216709 (bitIndex!0 (size!2851 (buf!3264 thiss!1634)) (currentByte!6088 thiss!1634) (currentBit!6083 thiss!1634)))))

(declare-fun isPrefixOf!0 (BitStream!4966 BitStream!4966) Bool)

(assert (=> b!138927 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!8658 0))(
  ( (Unit!8659) )
))
(declare-fun lt!216711 () Unit!8658)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4966) Unit!8658)

(assert (=> b!138927 (= lt!216711 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (= (and start!26984 res!115815) b!138926))

(assert (= (and b!138926 res!115818) b!138924))

(assert (= (and b!138924 res!115817) b!138927))

(assert (= (and b!138927 (not res!115816)) b!138923))

(assert (= start!26984 b!138925))

(declare-fun m!213841 () Bool)

(assert (=> start!26984 m!213841))

(declare-fun m!213843 () Bool)

(assert (=> start!26984 m!213843))

(declare-fun m!213845 () Bool)

(assert (=> b!138927 m!213845))

(declare-fun m!213847 () Bool)

(assert (=> b!138927 m!213847))

(declare-fun m!213849 () Bool)

(assert (=> b!138927 m!213849))

(declare-fun m!213851 () Bool)

(assert (=> b!138925 m!213851))

(declare-fun m!213853 () Bool)

(assert (=> b!138923 m!213853))

(declare-fun m!213855 () Bool)

(assert (=> b!138926 m!213855))

(push 1)

(assert (not b!138923))

(assert (not b!138925))

(assert (not b!138926))

(assert (not start!26984))

(assert (not b!138927))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

