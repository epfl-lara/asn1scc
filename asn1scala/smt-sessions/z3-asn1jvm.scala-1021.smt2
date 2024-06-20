; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29304 () Bool)

(assert start!29304)

(declare-fun lt!237905 () (_ BitVec 64))

(declare-fun lt!237904 () (_ BitVec 64))

(declare-fun e!101458 () Bool)

(declare-fun b!151849 () Bool)

(declare-fun lt!237906 () (_ BitVec 64))

(assert (=> b!151849 (= e!101458 (not (or (not (= lt!237905 (bvand lt!237904 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!237905 (bvand (bvadd lt!237906 lt!237904) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!151849 (= lt!237905 (bvand lt!237906 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!151849 (= lt!237904 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!404 from!447))))))

(declare-datatypes ((array!6763 0))(
  ( (array!6764 (arr!3876 (Array (_ BitVec 32) (_ BitVec 8))) (size!3059 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5376 0))(
  ( (BitStream!5377 (buf!3556 array!6763) (currentByte!6488 (_ BitVec 32)) (currentBit!6483 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5376)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!151849 (= lt!237906 (bitIndex!0 (size!3059 (buf!3556 thiss!1634)) (currentByte!6488 thiss!1634) (currentBit!6483 thiss!1634)))))

(declare-fun isPrefixOf!0 (BitStream!5376 BitStream!5376) Bool)

(assert (=> b!151849 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!9630 0))(
  ( (Unit!9631) )
))
(declare-fun lt!237907 () Unit!9630)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5376) Unit!9630)

(assert (=> b!151849 (= lt!237907 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun b!151848 () Bool)

(declare-fun res!127335 () Bool)

(assert (=> b!151848 (=> (not res!127335) (not e!101458))))

(assert (=> b!151848 (= res!127335 (bvsge from!447 to!404))))

(declare-fun b!151847 () Bool)

(declare-fun res!127334 () Bool)

(assert (=> b!151847 (=> (not res!127334) (not e!101458))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!151847 (= res!127334 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3059 (buf!3556 thiss!1634))) ((_ sign_extend 32) (currentByte!6488 thiss!1634)) ((_ sign_extend 32) (currentBit!6483 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!151850 () Bool)

(declare-fun e!101460 () Bool)

(declare-fun array_inv!2848 (array!6763) Bool)

(assert (=> b!151850 (= e!101460 (array_inv!2848 (buf!3556 thiss!1634)))))

(declare-fun res!127333 () Bool)

(assert (=> start!29304 (=> (not res!127333) (not e!101458))))

(declare-fun arr!237 () array!6763)

(assert (=> start!29304 (= res!127333 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3059 arr!237))))))

(assert (=> start!29304 e!101458))

(assert (=> start!29304 true))

(assert (=> start!29304 (array_inv!2848 arr!237)))

(declare-fun inv!12 (BitStream!5376) Bool)

(assert (=> start!29304 (and (inv!12 thiss!1634) e!101460)))

(assert (= (and start!29304 res!127333) b!151847))

(assert (= (and b!151847 res!127334) b!151848))

(assert (= (and b!151848 res!127335) b!151849))

(assert (= start!29304 b!151850))

(declare-fun m!237555 () Bool)

(assert (=> b!151849 m!237555))

(declare-fun m!237557 () Bool)

(assert (=> b!151849 m!237557))

(declare-fun m!237559 () Bool)

(assert (=> b!151849 m!237559))

(declare-fun m!237561 () Bool)

(assert (=> b!151847 m!237561))

(declare-fun m!237563 () Bool)

(assert (=> b!151850 m!237563))

(declare-fun m!237565 () Bool)

(assert (=> start!29304 m!237565))

(declare-fun m!237567 () Bool)

(assert (=> start!29304 m!237567))

(check-sat (not start!29304) (not b!151847) (not b!151850) (not b!151849))
(check-sat)
