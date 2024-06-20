; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29298 () Bool)

(assert start!29298)

(declare-fun b!151814 () Bool)

(declare-fun e!101424 () Bool)

(declare-datatypes ((array!6757 0))(
  ( (array!6758 (arr!3873 (Array (_ BitVec 32) (_ BitVec 8))) (size!3056 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5370 0))(
  ( (BitStream!5371 (buf!3553 array!6757) (currentByte!6485 (_ BitVec 32)) (currentBit!6480 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5370)

(declare-fun array_inv!2845 (array!6757) Bool)

(assert (=> b!151814 (= e!101424 (array_inv!2845 (buf!3553 thiss!1634)))))

(declare-fun b!151812 () Bool)

(declare-fun res!127306 () Bool)

(declare-fun e!101422 () Bool)

(assert (=> b!151812 (=> (not res!127306) (not e!101422))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!151812 (= res!127306 (bvsge from!447 to!404))))

(declare-fun res!127307 () Bool)

(assert (=> start!29298 (=> (not res!127307) (not e!101422))))

(declare-fun arr!237 () array!6757)

(assert (=> start!29298 (= res!127307 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3056 arr!237))))))

(assert (=> start!29298 e!101422))

(assert (=> start!29298 true))

(assert (=> start!29298 (array_inv!2845 arr!237)))

(declare-fun inv!12 (BitStream!5370) Bool)

(assert (=> start!29298 (and (inv!12 thiss!1634) e!101424)))

(declare-fun b!151813 () Bool)

(declare-fun lt!237872 () (_ BitVec 64))

(assert (=> b!151813 (= e!101422 (not (or (= lt!237872 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!237872) lt!237872)))))))

(assert (=> b!151813 (= lt!237872 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun lt!237874 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!151813 (= lt!237874 (bitIndex!0 (size!3056 (buf!3553 thiss!1634)) (currentByte!6485 thiss!1634) (currentBit!6480 thiss!1634)))))

(declare-fun isPrefixOf!0 (BitStream!5370 BitStream!5370) Bool)

(assert (=> b!151813 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!9624 0))(
  ( (Unit!9625) )
))
(declare-fun lt!237873 () Unit!9624)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5370) Unit!9624)

(assert (=> b!151813 (= lt!237873 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun b!151811 () Bool)

(declare-fun res!127308 () Bool)

(assert (=> b!151811 (=> (not res!127308) (not e!101422))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!151811 (= res!127308 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3056 (buf!3553 thiss!1634))) ((_ sign_extend 32) (currentByte!6485 thiss!1634)) ((_ sign_extend 32) (currentBit!6480 thiss!1634)) (bvsub to!404 from!447)))))

(assert (= (and start!29298 res!127307) b!151811))

(assert (= (and b!151811 res!127308) b!151812))

(assert (= (and b!151812 res!127306) b!151813))

(assert (= start!29298 b!151814))

(declare-fun m!237513 () Bool)

(assert (=> b!151814 m!237513))

(declare-fun m!237515 () Bool)

(assert (=> start!29298 m!237515))

(declare-fun m!237517 () Bool)

(assert (=> start!29298 m!237517))

(declare-fun m!237519 () Bool)

(assert (=> b!151813 m!237519))

(declare-fun m!237521 () Bool)

(assert (=> b!151813 m!237521))

(declare-fun m!237523 () Bool)

(assert (=> b!151813 m!237523))

(declare-fun m!237525 () Bool)

(assert (=> b!151811 m!237525))

(check-sat (not b!151813) (not b!151811) (not start!29298) (not b!151814))
(check-sat)
