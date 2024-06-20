; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49054 () Bool)

(assert start!49054)

(declare-fun b!233013 () Bool)

(declare-fun e!160500 () Bool)

(assert (=> b!233013 (= e!160500 false)))

(declare-fun lt!369084 () (_ BitVec 64))

(declare-datatypes ((array!12023 0))(
  ( (array!12024 (arr!6264 (Array (_ BitVec 32) (_ BitVec 8))) (size!5277 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9650 0))(
  ( (BitStream!9651 (buf!5818 array!12023) (currentByte!10825 (_ BitVec 32)) (currentBit!10820 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9650)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!233013 (= lt!369084 (bitIndex!0 (size!5277 (buf!5818 b1!101)) (currentByte!10825 b1!101) (currentBit!10820 b1!101)))))

(declare-fun b!233014 () Bool)

(declare-fun res!194961 () Bool)

(assert (=> b!233014 (=> (not res!194961) (not e!160500))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun b2!99 () BitStream!9650)

(assert (=> b!233014 (= res!194961 (bvsle bits!86 (bitIndex!0 (size!5277 (buf!5818 b2!99)) (currentByte!10825 b2!99) (currentBit!10820 b2!99))))))

(declare-fun b!233015 () Bool)

(declare-fun res!194962 () Bool)

(assert (=> b!233015 (=> (not res!194962) (not e!160500))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!233015 (= res!194962 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5277 (buf!5818 b1!101))) ((_ sign_extend 32) (currentByte!10825 b1!101)) ((_ sign_extend 32) (currentBit!10820 b1!101)) bytes!19))))

(declare-fun b!233016 () Bool)

(declare-fun e!160499 () Bool)

(declare-fun array_inv!5018 (array!12023) Bool)

(assert (=> b!233016 (= e!160499 (array_inv!5018 (buf!5818 b2!99)))))

(declare-fun res!194964 () Bool)

(assert (=> start!49054 (=> (not res!194964) (not e!160500))))

(assert (=> start!49054 (= res!194964 (and (= (size!5277 (buf!5818 b1!101)) (size!5277 (buf!5818 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49054 e!160500))

(declare-fun e!160502 () Bool)

(declare-fun inv!12 (BitStream!9650) Bool)

(assert (=> start!49054 (and (inv!12 b1!101) e!160502)))

(assert (=> start!49054 (and (inv!12 b2!99) e!160499)))

(assert (=> start!49054 true))

(declare-fun b!233017 () Bool)

(assert (=> b!233017 (= e!160502 (array_inv!5018 (buf!5818 b1!101)))))

(declare-fun b!233018 () Bool)

(declare-fun res!194963 () Bool)

(assert (=> b!233018 (=> (not res!194963) (not e!160500))))

(assert (=> b!233018 (= res!194963 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(assert (= (and start!49054 res!194964) b!233014))

(assert (= (and b!233014 res!194961) b!233018))

(assert (= (and b!233018 res!194963) b!233015))

(assert (= (and b!233015 res!194962) b!233013))

(assert (= start!49054 b!233017))

(assert (= start!49054 b!233016))

(declare-fun m!355755 () Bool)

(assert (=> start!49054 m!355755))

(declare-fun m!355757 () Bool)

(assert (=> start!49054 m!355757))

(declare-fun m!355759 () Bool)

(assert (=> b!233014 m!355759))

(declare-fun m!355761 () Bool)

(assert (=> b!233013 m!355761))

(declare-fun m!355763 () Bool)

(assert (=> b!233017 m!355763))

(declare-fun m!355765 () Bool)

(assert (=> b!233016 m!355765))

(declare-fun m!355767 () Bool)

(assert (=> b!233015 m!355767))

(push 1)

(assert (not b!233017))

(assert (not b!233016))

(assert (not b!233013))

