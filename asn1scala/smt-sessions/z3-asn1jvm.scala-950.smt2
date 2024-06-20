; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26940 () Bool)

(assert start!26940)

(declare-fun res!115742 () Bool)

(declare-fun e!92360 () Bool)

(assert (=> start!26940 (=> (not res!115742) (not e!92360))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6287 0))(
  ( (array!6288 (arr!3541 (Array (_ BitVec 32) (_ BitVec 8))) (size!2846 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6287)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!26940 (= res!115742 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2846 arr!237))))))

(assert (=> start!26940 e!92360))

(assert (=> start!26940 true))

(declare-fun array_inv!2635 (array!6287) Bool)

(assert (=> start!26940 (array_inv!2635 arr!237)))

(declare-datatypes ((BitStream!4956 0))(
  ( (BitStream!4957 (buf!3259 array!6287) (currentByte!6078 (_ BitVec 32)) (currentBit!6073 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4956)

(declare-fun e!92358 () Bool)

(declare-fun inv!12 (BitStream!4956) Bool)

(assert (=> start!26940 (and (inv!12 thiss!1634) e!92358)))

(declare-fun b!138834 () Bool)

(declare-fun res!115741 () Bool)

(assert (=> b!138834 (=> (not res!115741) (not e!92360))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!138834 (= res!115741 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2846 (buf!3259 thiss!1634))) ((_ sign_extend 32) (currentByte!6078 thiss!1634)) ((_ sign_extend 32) (currentBit!6073 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!138837 () Bool)

(assert (=> b!138837 (= e!92358 (array_inv!2635 (buf!3259 thiss!1634)))))

(declare-fun b!138835 () Bool)

(declare-fun res!115743 () Bool)

(assert (=> b!138835 (=> (not res!115743) (not e!92360))))

(assert (=> b!138835 (= res!115743 (bvsge from!447 to!404))))

(declare-fun b!138836 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!138836 (= e!92360 (not (invariant!0 (currentBit!6073 thiss!1634) (currentByte!6078 thiss!1634) (size!2846 (buf!3259 thiss!1634)))))))

(declare-fun isPrefixOf!0 (BitStream!4956 BitStream!4956) Bool)

(assert (=> b!138836 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!8648 0))(
  ( (Unit!8649) )
))
(declare-fun lt!216672 () Unit!8648)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4956) Unit!8648)

(assert (=> b!138836 (= lt!216672 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (= (and start!26940 res!115742) b!138834))

(assert (= (and b!138834 res!115741) b!138835))

(assert (= (and b!138835 res!115743) b!138836))

(assert (= start!26940 b!138837))

(declare-fun m!213751 () Bool)

(assert (=> start!26940 m!213751))

(declare-fun m!213753 () Bool)

(assert (=> start!26940 m!213753))

(declare-fun m!213755 () Bool)

(assert (=> b!138834 m!213755))

(declare-fun m!213757 () Bool)

(assert (=> b!138837 m!213757))

(declare-fun m!213759 () Bool)

(assert (=> b!138836 m!213759))

(declare-fun m!213761 () Bool)

(assert (=> b!138836 m!213761))

(declare-fun m!213763 () Bool)

(assert (=> b!138836 m!213763))

(check-sat (not start!26940) (not b!138837) (not b!138836) (not b!138834))
(check-sat)
(get-model)

