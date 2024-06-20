; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29294 () Bool)

(assert start!29294)

(declare-fun b!151787 () Bool)

(declare-fun res!127290 () Bool)

(declare-fun e!101400 () Bool)

(assert (=> b!151787 (=> (not res!127290) (not e!101400))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6753 0))(
  ( (array!6754 (arr!3871 (Array (_ BitVec 32) (_ BitVec 8))) (size!3054 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5366 0))(
  ( (BitStream!5367 (buf!3551 array!6753) (currentByte!6483 (_ BitVec 32)) (currentBit!6478 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5366)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!151787 (= res!127290 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3054 (buf!3551 thiss!1634))) ((_ sign_extend 32) (currentByte!6483 thiss!1634)) ((_ sign_extend 32) (currentBit!6478 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!151788 () Bool)

(declare-fun res!127288 () Bool)

(assert (=> b!151788 (=> (not res!127288) (not e!101400))))

(assert (=> b!151788 (= res!127288 (bvsge from!447 to!404))))

(declare-fun res!127289 () Bool)

(assert (=> start!29294 (=> (not res!127289) (not e!101400))))

(declare-fun arr!237 () array!6753)

(assert (=> start!29294 (= res!127289 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3054 arr!237))))))

(assert (=> start!29294 e!101400))

(assert (=> start!29294 true))

(declare-fun array_inv!2843 (array!6753) Bool)

(assert (=> start!29294 (array_inv!2843 arr!237)))

(declare-fun e!101399 () Bool)

(declare-fun inv!12 (BitStream!5366) Bool)

(assert (=> start!29294 (and (inv!12 thiss!1634) e!101399)))

(declare-fun b!151789 () Bool)

(assert (=> b!151789 (= e!101400 (not (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000)))))))

(declare-fun lt!237856 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!151789 (= lt!237856 (bitIndex!0 (size!3054 (buf!3551 thiss!1634)) (currentByte!6483 thiss!1634) (currentBit!6478 thiss!1634)))))

(declare-fun isPrefixOf!0 (BitStream!5366 BitStream!5366) Bool)

(assert (=> b!151789 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!9620 0))(
  ( (Unit!9621) )
))
(declare-fun lt!237855 () Unit!9620)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5366) Unit!9620)

(assert (=> b!151789 (= lt!237855 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun b!151790 () Bool)

(assert (=> b!151790 (= e!101399 (array_inv!2843 (buf!3551 thiss!1634)))))

(assert (= (and start!29294 res!127289) b!151787))

(assert (= (and b!151787 res!127290) b!151788))

(assert (= (and b!151788 res!127288) b!151789))

(assert (= start!29294 b!151790))

(declare-fun m!237485 () Bool)

(assert (=> b!151787 m!237485))

(declare-fun m!237487 () Bool)

(assert (=> start!29294 m!237487))

(declare-fun m!237489 () Bool)

(assert (=> start!29294 m!237489))

(declare-fun m!237491 () Bool)

(assert (=> b!151789 m!237491))

(declare-fun m!237493 () Bool)

(assert (=> b!151789 m!237493))

(declare-fun m!237495 () Bool)

(assert (=> b!151789 m!237495))

(declare-fun m!237497 () Bool)

(assert (=> b!151790 m!237497))

(push 1)

(assert (not start!29294))

(assert (not b!151789))

(assert (not b!151790))

(assert (not b!151787))

(check-sat)

(pop 1)

(push 1)

(check-sat)

