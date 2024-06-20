; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56206 () Bool)

(assert start!56206)

(declare-fun res!218077 () Bool)

(declare-fun e!180933 () Bool)

(assert (=> start!56206 (=> (not res!218077) (not e!180933))))

(declare-datatypes ((array!14297 0))(
  ( (array!14298 (arr!7241 (Array (_ BitVec 32) (_ BitVec 8))) (size!6254 (_ BitVec 32))) )
))
(declare-fun buf!79 () array!14297)

(declare-datatypes ((BitStream!11430 0))(
  ( (BitStream!11431 (buf!6776 array!14297) (currentByte!12469 (_ BitVec 32)) (currentBit!12464 (_ BitVec 32))) )
))
(declare-fun b1!100 () BitStream!11430)

(declare-fun bits!81 () (_ BitVec 64))

(assert (=> start!56206 (= res!218077 (and (= (size!6254 (buf!6776 b1!100)) (size!6254 buf!79)) (bvsge bits!81 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!56206 e!180933))

(declare-fun e!180931 () Bool)

(declare-fun inv!12 (BitStream!11430) Bool)

(assert (=> start!56206 (and (inv!12 b1!100) e!180931)))

(declare-fun array_inv!5995 (array!14297) Bool)

(assert (=> start!56206 (array_inv!5995 buf!79)))

(assert (=> start!56206 true))

(declare-fun b!260483 () Bool)

(declare-fun res!218076 () Bool)

(assert (=> b!260483 (=> (not res!218076) (not e!180933))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!260483 (= res!218076 (validate_offset_bits!1 ((_ sign_extend 32) (size!6254 (buf!6776 b1!100))) ((_ sign_extend 32) (currentByte!12469 b1!100)) ((_ sign_extend 32) (currentBit!12464 b1!100)) bits!81))))

(declare-fun b!260484 () Bool)

(assert (=> b!260484 (= e!180933 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!6254 buf!79)) ((_ sign_extend 32) (currentByte!12469 b1!100)) ((_ sign_extend 32) (currentBit!12464 b1!100)) bits!81)))))

(declare-fun b!260485 () Bool)

(assert (=> b!260485 (= e!180931 (array_inv!5995 (buf!6776 b1!100)))))

(assert (= (and start!56206 res!218077) b!260483))

(assert (= (and b!260483 res!218076) b!260484))

(assert (= start!56206 b!260485))

(declare-fun m!389779 () Bool)

(assert (=> start!56206 m!389779))

(declare-fun m!389781 () Bool)

(assert (=> start!56206 m!389781))

(declare-fun m!389783 () Bool)

(assert (=> b!260483 m!389783))

(declare-fun m!389785 () Bool)

(assert (=> b!260484 m!389785))

(declare-fun m!389787 () Bool)

(assert (=> b!260485 m!389787))

(check-sat (not b!260484) (not start!56206) (not b!260483) (not b!260485))
(check-sat)
