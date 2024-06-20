; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29296 () Bool)

(assert start!29296)

(declare-fun b!151801 () Bool)

(declare-fun e!101409 () Bool)

(declare-fun lt!237865 () (_ BitVec 64))

(assert (=> b!151801 (= e!101409 (not (or (= lt!237865 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!237865) lt!237865)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!151801 (= lt!237865 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun lt!237864 () (_ BitVec 64))

(declare-datatypes ((array!6755 0))(
  ( (array!6756 (arr!3872 (Array (_ BitVec 32) (_ BitVec 8))) (size!3055 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5368 0))(
  ( (BitStream!5369 (buf!3552 array!6755) (currentByte!6484 (_ BitVec 32)) (currentBit!6479 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5368)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!151801 (= lt!237864 (bitIndex!0 (size!3055 (buf!3552 thiss!1634)) (currentByte!6484 thiss!1634) (currentBit!6479 thiss!1634)))))

(declare-fun isPrefixOf!0 (BitStream!5368 BitStream!5368) Bool)

(assert (=> b!151801 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!9622 0))(
  ( (Unit!9623) )
))
(declare-fun lt!237863 () Unit!9622)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5368) Unit!9622)

(assert (=> b!151801 (= lt!237863 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun b!151800 () Bool)

(declare-fun res!127298 () Bool)

(assert (=> b!151800 (=> (not res!127298) (not e!101409))))

(assert (=> b!151800 (= res!127298 (bvsge from!447 to!404))))

(declare-fun b!151802 () Bool)

(declare-fun e!101410 () Bool)

(declare-fun array_inv!2844 (array!6755) Bool)

(assert (=> b!151802 (= e!101410 (array_inv!2844 (buf!3552 thiss!1634)))))

(declare-fun res!127297 () Bool)

(assert (=> start!29296 (=> (not res!127297) (not e!101409))))

(declare-fun arr!237 () array!6755)

(assert (=> start!29296 (= res!127297 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3055 arr!237))))))

(assert (=> start!29296 e!101409))

(assert (=> start!29296 true))

(assert (=> start!29296 (array_inv!2844 arr!237)))

(declare-fun inv!12 (BitStream!5368) Bool)

(assert (=> start!29296 (and (inv!12 thiss!1634) e!101410)))

(declare-fun b!151799 () Bool)

(declare-fun res!127299 () Bool)

(assert (=> b!151799 (=> (not res!127299) (not e!101409))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!151799 (= res!127299 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3055 (buf!3552 thiss!1634))) ((_ sign_extend 32) (currentByte!6484 thiss!1634)) ((_ sign_extend 32) (currentBit!6479 thiss!1634)) (bvsub to!404 from!447)))))

(assert (= (and start!29296 res!127297) b!151799))

(assert (= (and b!151799 res!127299) b!151800))

(assert (= (and b!151800 res!127298) b!151801))

(assert (= start!29296 b!151802))

(declare-fun m!237499 () Bool)

(assert (=> b!151801 m!237499))

(declare-fun m!237501 () Bool)

(assert (=> b!151801 m!237501))

(declare-fun m!237503 () Bool)

(assert (=> b!151801 m!237503))

(declare-fun m!237505 () Bool)

(assert (=> b!151802 m!237505))

(declare-fun m!237507 () Bool)

(assert (=> start!29296 m!237507))

(declare-fun m!237509 () Bool)

(assert (=> start!29296 m!237509))

(declare-fun m!237511 () Bool)

(assert (=> b!151799 m!237511))

(push 1)

(assert (not b!151801))

(assert (not b!151799))

(assert (not start!29296))

(assert (not b!151802))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

