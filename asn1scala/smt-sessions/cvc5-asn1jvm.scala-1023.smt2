; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29314 () Bool)

(assert start!29314)

(declare-fun b!151918 () Bool)

(declare-fun e!101529 () Bool)

(declare-fun e!101531 () Bool)

(assert (=> b!151918 (= e!101529 (not e!101531))))

(declare-fun res!127392 () Bool)

(assert (=> b!151918 (=> res!127392 e!101531)))

(declare-fun lt!237955 () (_ BitVec 64))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!151918 (= res!127392 (not (= lt!237955 (bvadd lt!237955 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!404 from!447)))))))))

(declare-datatypes ((array!6773 0))(
  ( (array!6774 (arr!3881 (Array (_ BitVec 32) (_ BitVec 8))) (size!3064 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5386 0))(
  ( (BitStream!5387 (buf!3561 array!6773) (currentByte!6493 (_ BitVec 32)) (currentBit!6488 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5386)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!151918 (= lt!237955 (bitIndex!0 (size!3064 (buf!3561 thiss!1634)) (currentByte!6493 thiss!1634) (currentBit!6488 thiss!1634)))))

(declare-fun isPrefixOf!0 (BitStream!5386 BitStream!5386) Bool)

(assert (=> b!151918 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!9640 0))(
  ( (Unit!9641) )
))
(declare-fun lt!237953 () Unit!9640)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5386) Unit!9640)

(assert (=> b!151918 (= lt!237953 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun b!151919 () Bool)

(declare-fun res!127390 () Bool)

(assert (=> b!151919 (=> (not res!127390) (not e!101529))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!151919 (= res!127390 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3064 (buf!3561 thiss!1634))) ((_ sign_extend 32) (currentByte!6493 thiss!1634)) ((_ sign_extend 32) (currentBit!6488 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!151920 () Bool)

(declare-fun res!127391 () Bool)

(assert (=> b!151920 (=> (not res!127391) (not e!101529))))

(assert (=> b!151920 (= res!127391 (bvsge from!447 to!404))))

(declare-fun b!151921 () Bool)

(assert (=> b!151921 (= e!101531 true)))

(declare-datatypes ((tuple2!13522 0))(
  ( (tuple2!13523 (_1!7136 BitStream!5386) (_2!7136 BitStream!5386)) )
))
(declare-fun lt!237954 () tuple2!13522)

(declare-fun reader!0 (BitStream!5386 BitStream!5386) tuple2!13522)

(assert (=> b!151921 (= lt!237954 (reader!0 thiss!1634 thiss!1634))))

(declare-fun b!151922 () Bool)

(declare-fun e!101530 () Bool)

(declare-fun array_inv!2853 (array!6773) Bool)

(assert (=> b!151922 (= e!101530 (array_inv!2853 (buf!3561 thiss!1634)))))

(declare-fun res!127389 () Bool)

(assert (=> start!29314 (=> (not res!127389) (not e!101529))))

(declare-fun arr!237 () array!6773)

(assert (=> start!29314 (= res!127389 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3064 arr!237))))))

(assert (=> start!29314 e!101529))

(assert (=> start!29314 true))

(assert (=> start!29314 (array_inv!2853 arr!237)))

(declare-fun inv!12 (BitStream!5386) Bool)

(assert (=> start!29314 (and (inv!12 thiss!1634) e!101530)))

(assert (= (and start!29314 res!127389) b!151919))

(assert (= (and b!151919 res!127390) b!151920))

(assert (= (and b!151920 res!127391) b!151918))

(assert (= (and b!151918 (not res!127392)) b!151921))

(assert (= start!29314 b!151922))

(declare-fun m!237631 () Bool)

(assert (=> b!151922 m!237631))

(declare-fun m!237633 () Bool)

(assert (=> start!29314 m!237633))

(declare-fun m!237635 () Bool)

(assert (=> start!29314 m!237635))

(declare-fun m!237637 () Bool)

(assert (=> b!151921 m!237637))

(declare-fun m!237639 () Bool)

(assert (=> b!151919 m!237639))

(declare-fun m!237641 () Bool)

(assert (=> b!151918 m!237641))

(declare-fun m!237643 () Bool)

(assert (=> b!151918 m!237643))

(declare-fun m!237645 () Bool)

(assert (=> b!151918 m!237645))

(push 1)

(assert (not start!29314))

(assert (not b!151922))

(assert (not b!151921))

(assert (not b!151919))

(assert (not b!151918))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

