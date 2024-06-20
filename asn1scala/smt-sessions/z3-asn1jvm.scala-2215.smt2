; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56182 () Bool)

(assert start!56182)

(declare-fun res!218058 () Bool)

(declare-fun e!180896 () Bool)

(assert (=> start!56182 (=> (not res!218058) (not e!180896))))

(declare-datatypes ((array!14288 0))(
  ( (array!14289 (arr!7238 (Array (_ BitVec 32) (_ BitVec 8))) (size!6251 (_ BitVec 32))) )
))
(declare-fun buf!79 () array!14288)

(declare-datatypes ((BitStream!11424 0))(
  ( (BitStream!11425 (buf!6773 array!14288) (currentByte!12463 (_ BitVec 32)) (currentBit!12458 (_ BitVec 32))) )
))
(declare-fun b1!100 () BitStream!11424)

(declare-fun bits!81 () (_ BitVec 64))

(assert (=> start!56182 (= res!218058 (and (= (size!6251 (buf!6773 b1!100)) (size!6251 buf!79)) (bvsge bits!81 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!56182 e!180896))

(declare-fun e!180895 () Bool)

(declare-fun inv!12 (BitStream!11424) Bool)

(assert (=> start!56182 (and (inv!12 b1!100) e!180895)))

(declare-fun array_inv!5992 (array!14288) Bool)

(assert (=> start!56182 (array_inv!5992 buf!79)))

(assert (=> start!56182 true))

(declare-fun b!260456 () Bool)

(declare-fun res!218059 () Bool)

(assert (=> b!260456 (=> (not res!218059) (not e!180896))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!260456 (= res!218059 (validate_offset_bits!1 ((_ sign_extend 32) (size!6251 (buf!6773 b1!100))) ((_ sign_extend 32) (currentByte!12463 b1!100)) ((_ sign_extend 32) (currentBit!12458 b1!100)) bits!81))))

(declare-fun b!260457 () Bool)

(assert (=> b!260457 (= e!180896 (not (inv!12 (BitStream!11425 buf!79 (currentByte!12463 b1!100) (currentBit!12458 b1!100)))))))

(declare-fun b!260458 () Bool)

(assert (=> b!260458 (= e!180895 (array_inv!5992 (buf!6773 b1!100)))))

(assert (= (and start!56182 res!218058) b!260456))

(assert (= (and b!260456 res!218059) b!260457))

(assert (= start!56182 b!260458))

(declare-fun m!389731 () Bool)

(assert (=> start!56182 m!389731))

(declare-fun m!389733 () Bool)

(assert (=> start!56182 m!389733))

(declare-fun m!389735 () Bool)

(assert (=> b!260456 m!389735))

(declare-fun m!389737 () Bool)

(assert (=> b!260457 m!389737))

(declare-fun m!389739 () Bool)

(assert (=> b!260458 m!389739))

(check-sat (not b!260456) (not b!260457) (not start!56182) (not b!260458))
(check-sat)
(get-model)

(declare-fun d!87410 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87410 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6251 (buf!6773 b1!100))) ((_ sign_extend 32) (currentByte!12463 b1!100)) ((_ sign_extend 32) (currentBit!12458 b1!100)) bits!81) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6251 (buf!6773 b1!100))) ((_ sign_extend 32) (currentByte!12463 b1!100)) ((_ sign_extend 32) (currentBit!12458 b1!100))) bits!81))))

(declare-fun bs!22148 () Bool)

(assert (= bs!22148 d!87410))

(declare-fun m!389751 () Bool)

(assert (=> bs!22148 m!389751))

(assert (=> b!260456 d!87410))

(declare-fun d!87412 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87412 (= (inv!12 (BitStream!11425 buf!79 (currentByte!12463 b1!100) (currentBit!12458 b1!100))) (invariant!0 (currentBit!12458 (BitStream!11425 buf!79 (currentByte!12463 b1!100) (currentBit!12458 b1!100))) (currentByte!12463 (BitStream!11425 buf!79 (currentByte!12463 b1!100) (currentBit!12458 b1!100))) (size!6251 (buf!6773 (BitStream!11425 buf!79 (currentByte!12463 b1!100) (currentBit!12458 b1!100))))))))

(declare-fun bs!22149 () Bool)

(assert (= bs!22149 d!87412))

(declare-fun m!389753 () Bool)

(assert (=> bs!22149 m!389753))

(assert (=> b!260457 d!87412))

(declare-fun d!87418 () Bool)

(assert (=> d!87418 (= (inv!12 b1!100) (invariant!0 (currentBit!12458 b1!100) (currentByte!12463 b1!100) (size!6251 (buf!6773 b1!100))))))

(declare-fun bs!22150 () Bool)

(assert (= bs!22150 d!87418))

(declare-fun m!389755 () Bool)

(assert (=> bs!22150 m!389755))

(assert (=> start!56182 d!87418))

(declare-fun d!87420 () Bool)

(assert (=> d!87420 (= (array_inv!5992 buf!79) (bvsge (size!6251 buf!79) #b00000000000000000000000000000000))))

(assert (=> start!56182 d!87420))

(declare-fun d!87428 () Bool)

(assert (=> d!87428 (= (array_inv!5992 (buf!6773 b1!100)) (bvsge (size!6251 (buf!6773 b1!100)) #b00000000000000000000000000000000))))

(assert (=> b!260458 d!87428))

(check-sat (not d!87412) (not d!87418) (not d!87410))
(check-sat)
