; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29290 () Bool)

(assert start!29290)

(declare-fun b!151766 () Bool)

(declare-fun e!101376 () Bool)

(declare-datatypes ((array!6749 0))(
  ( (array!6750 (arr!3869 (Array (_ BitVec 32) (_ BitVec 8))) (size!3052 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5362 0))(
  ( (BitStream!5363 (buf!3549 array!6749) (currentByte!6481 (_ BitVec 32)) (currentBit!6476 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5362)

(declare-fun array_inv!2841 (array!6749) Bool)

(assert (=> b!151766 (= e!101376 (array_inv!2841 (buf!3549 thiss!1634)))))

(declare-fun b!151764 () Bool)

(declare-fun res!127271 () Bool)

(declare-fun e!101373 () Bool)

(assert (=> b!151764 (=> (not res!127271) (not e!101373))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!151764 (= res!127271 (bvsge from!447 to!404))))

(declare-fun b!151765 () Bool)

(assert (=> b!151765 (= e!101373 (not (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000)))))))

(declare-fun lt!237844 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!151765 (= lt!237844 (bitIndex!0 (size!3052 (buf!3549 thiss!1634)) (currentByte!6481 thiss!1634) (currentBit!6476 thiss!1634)))))

(declare-fun isPrefixOf!0 (BitStream!5362 BitStream!5362) Bool)

(assert (=> b!151765 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!9616 0))(
  ( (Unit!9617) )
))
(declare-fun lt!237843 () Unit!9616)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5362) Unit!9616)

(assert (=> b!151765 (= lt!237843 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun res!127270 () Bool)

(assert (=> start!29290 (=> (not res!127270) (not e!101373))))

(declare-fun arr!237 () array!6749)

(assert (=> start!29290 (= res!127270 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3052 arr!237))))))

(assert (=> start!29290 e!101373))

(assert (=> start!29290 true))

(assert (=> start!29290 (array_inv!2841 arr!237)))

(declare-fun inv!12 (BitStream!5362) Bool)

(assert (=> start!29290 (and (inv!12 thiss!1634) e!101376)))

(declare-fun b!151763 () Bool)

(declare-fun res!127272 () Bool)

(assert (=> b!151763 (=> (not res!127272) (not e!101373))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!151763 (= res!127272 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3052 (buf!3549 thiss!1634))) ((_ sign_extend 32) (currentByte!6481 thiss!1634)) ((_ sign_extend 32) (currentBit!6476 thiss!1634)) (bvsub to!404 from!447)))))

(assert (= (and start!29290 res!127270) b!151763))

(assert (= (and b!151763 res!127272) b!151764))

(assert (= (and b!151764 res!127271) b!151765))

(assert (= start!29290 b!151766))

(declare-fun m!237457 () Bool)

(assert (=> b!151766 m!237457))

(declare-fun m!237459 () Bool)

(assert (=> b!151765 m!237459))

(declare-fun m!237461 () Bool)

(assert (=> b!151765 m!237461))

(declare-fun m!237463 () Bool)

(assert (=> b!151765 m!237463))

(declare-fun m!237465 () Bool)

(assert (=> start!29290 m!237465))

(declare-fun m!237467 () Bool)

(assert (=> start!29290 m!237467))

(declare-fun m!237469 () Bool)

(assert (=> b!151763 m!237469))

(push 1)

(assert (not start!29290))

(assert (not b!151765))

(assert (not b!151766))

(assert (not b!151763))

(check-sat)

(pop 1)

(push 1)

(check-sat)

