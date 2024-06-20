; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48884 () Bool)

(assert start!48884)

(declare-fun b!231290 () Bool)

(declare-fun e!159034 () Bool)

(declare-datatypes ((array!11853 0))(
  ( (array!11854 (arr!6179 (Array (_ BitVec 32) (_ BitVec 8))) (size!5192 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9480 0))(
  ( (BitStream!9481 (buf!5733 array!11853) (currentByte!10740 (_ BitVec 32)) (currentBit!10735 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9480)

(assert (=> b!231290 (= e!159034 (and (not (= ((_ sign_extend 32) (currentByte!10740 b1!101)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10740 b1!101))) ((_ sign_extend 32) (currentByte!10740 b1!101)))))))))

(declare-fun b!231291 () Bool)

(declare-fun res!193752 () Bool)

(assert (=> b!231291 (=> (not res!193752) (not e!159034))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231291 (= res!193752 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5192 (buf!5733 b1!101))) ((_ sign_extend 32) (currentByte!10740 b1!101)) ((_ sign_extend 32) (currentBit!10735 b1!101)) bytes!19))))

(declare-fun res!193751 () Bool)

(declare-fun e!159031 () Bool)

(assert (=> start!48884 (=> (not res!193751) (not e!159031))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun b2!99 () BitStream!9480)

(assert (=> start!48884 (= res!193751 (and (= (size!5192 (buf!5733 b1!101)) (size!5192 (buf!5733 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48884 e!159031))

(declare-fun e!159030 () Bool)

(declare-fun inv!12 (BitStream!9480) Bool)

(assert (=> start!48884 (and (inv!12 b1!101) e!159030)))

(declare-fun e!159033 () Bool)

(assert (=> start!48884 (and (inv!12 b2!99) e!159033)))

(assert (=> start!48884 true))

(declare-fun b!231292 () Bool)

(declare-fun res!193748 () Bool)

(assert (=> b!231292 (=> (not res!193748) (not e!159034))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!231292 (= res!193748 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5192 (buf!5733 b1!101))) ((_ sign_extend 32) (currentByte!10740 b1!101)) ((_ sign_extend 32) (currentBit!10735 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!231293 () Bool)

(declare-fun res!193749 () Bool)

(assert (=> b!231293 (=> (not res!193749) (not e!159034))))

(declare-fun lt!368631 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231293 (= res!193749 (= lt!368631 (bvadd (bitIndex!0 (size!5192 (buf!5733 b1!101)) (currentByte!10740 b1!101) (currentBit!10735 b1!101)) bits!86)))))

(declare-fun b!231294 () Bool)

(declare-fun array_inv!4933 (array!11853) Bool)

(assert (=> b!231294 (= e!159033 (array_inv!4933 (buf!5733 b2!99)))))

(declare-fun b!231295 () Bool)

(assert (=> b!231295 (= e!159030 (array_inv!4933 (buf!5733 b1!101)))))

(declare-fun b!231296 () Bool)

(assert (=> b!231296 (= e!159031 e!159034)))

(declare-fun res!193750 () Bool)

(assert (=> b!231296 (=> (not res!193750) (not e!159034))))

(assert (=> b!231296 (= res!193750 (and (bvsle bits!86 lt!368631) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(assert (=> b!231296 (= lt!368631 (bitIndex!0 (size!5192 (buf!5733 b2!99)) (currentByte!10740 b2!99) (currentBit!10735 b2!99)))))

(assert (= (and start!48884 res!193751) b!231296))

(assert (= (and b!231296 res!193750) b!231291))

(assert (= (and b!231291 res!193752) b!231293))

(assert (= (and b!231293 res!193749) b!231292))

(assert (= (and b!231292 res!193748) b!231290))

(assert (= start!48884 b!231295))

(assert (= start!48884 b!231294))

(declare-fun m!354447 () Bool)

(assert (=> b!231296 m!354447))

(declare-fun m!354449 () Bool)

(assert (=> b!231292 m!354449))

(declare-fun m!354451 () Bool)

(assert (=> b!231295 m!354451))

(declare-fun m!354453 () Bool)

(assert (=> b!231294 m!354453))

(declare-fun m!354455 () Bool)

(assert (=> b!231293 m!354455))

(declare-fun m!354457 () Bool)

(assert (=> start!48884 m!354457))

(declare-fun m!354459 () Bool)

(assert (=> start!48884 m!354459))

(declare-fun m!354461 () Bool)

(assert (=> b!231291 m!354461))

(check-sat (not b!231291) (not b!231294) (not b!231295) (not start!48884) (not b!231292) (not b!231293) (not b!231296))
(check-sat)
