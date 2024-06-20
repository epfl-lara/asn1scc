; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18954 () Bool)

(assert start!18954)

(declare-fun b!94589 () Bool)

(declare-fun res!77934 () Bool)

(declare-fun e!62048 () Bool)

(assert (=> b!94589 (=> (not res!77934) (not e!62048))))

(declare-datatypes ((array!4423 0))(
  ( (array!4424 (arr!2621 (Array (_ BitVec 32) (_ BitVec 8))) (size!2013 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3530 0))(
  ( (BitStream!3531 (buf!2374 array!4423) (currentByte!4737 (_ BitVec 32)) (currentBit!4732 (_ BitVec 32))) )
))
(declare-fun base!8 () BitStream!3530)

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!94589 (= res!77934 (bvslt (bitIndex!0 (size!2013 (buf!2374 base!8)) (currentByte!4737 base!8) (currentBit!4732 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!94590 () Bool)

(declare-fun res!77930 () Bool)

(assert (=> b!94590 (=> (not res!77930) (not e!62048))))

(declare-fun bitStream1!8 () BitStream!3530)

(declare-fun isPrefixOf!0 (BitStream!3530 BitStream!3530) Bool)

(assert (=> b!94590 (= res!77930 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!94591 () Bool)

(declare-fun e!62049 () Bool)

(declare-fun array_inv!1830 (array!4423) Bool)

(assert (=> b!94591 (= e!62049 (array_inv!1830 (buf!2374 bitStream1!8)))))

(declare-fun b!94592 () Bool)

(declare-fun res!77931 () Bool)

(assert (=> b!94592 (=> (not res!77931) (not e!62048))))

(declare-fun bitStream2!8 () BitStream!3530)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!94592 (= res!77931 (validate_offset_bits!1 ((_ sign_extend 32) (size!2013 (buf!2374 bitStream2!8))) ((_ sign_extend 32) (currentByte!4737 bitStream2!8)) ((_ sign_extend 32) (currentBit!4732 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!94593 () Bool)

(assert (=> b!94593 (= e!62048 false)))

(declare-datatypes ((tuple2!7658 0))(
  ( (tuple2!7659 (_1!4076 BitStream!3530) (_2!4076 Bool)) )
))
(declare-fun lt!138840 () tuple2!7658)

(declare-fun readBitPure!0 (BitStream!3530) tuple2!7658)

(assert (=> b!94593 (= lt!138840 (readBitPure!0 bitStream1!8))))

(declare-fun b!94594 () Bool)

(declare-fun res!77925 () Bool)

(assert (=> b!94594 (=> (not res!77925) (not e!62048))))

(declare-datatypes ((List!871 0))(
  ( (Nil!868) (Cons!867 (h!986 Bool) (t!1621 List!871)) )
))
(declare-fun listBits!13 () List!871)

(declare-fun length!462 (List!871) Int)

(assert (=> b!94594 (= res!77925 (> (length!462 listBits!13) 0))))

(declare-fun b!94595 () Bool)

(declare-fun res!77932 () Bool)

(assert (=> b!94595 (=> (not res!77932) (not e!62048))))

(assert (=> b!94595 (= res!77932 (and (= (buf!2374 bitStream1!8) (buf!2374 bitStream2!8)) (= (buf!2374 bitStream1!8) (buf!2374 base!8))))))

(declare-fun res!77927 () Bool)

(assert (=> start!18954 (=> (not res!77927) (not e!62048))))

(assert (=> start!18954 (= res!77927 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18954 e!62048))

(assert (=> start!18954 true))

(declare-fun inv!12 (BitStream!3530) Bool)

(assert (=> start!18954 (and (inv!12 bitStream1!8) e!62049)))

(declare-fun e!62046 () Bool)

(assert (=> start!18954 (and (inv!12 bitStream2!8) e!62046)))

(declare-fun e!62044 () Bool)

(assert (=> start!18954 (and (inv!12 base!8) e!62044)))

(declare-fun thiss!1534 () BitStream!3530)

(declare-fun e!62047 () Bool)

(assert (=> start!18954 (and (inv!12 thiss!1534) e!62047)))

(declare-fun b!94596 () Bool)

(declare-fun res!77933 () Bool)

(assert (=> b!94596 (=> (not res!77933) (not e!62048))))

(assert (=> b!94596 (= res!77933 (validate_offset_bits!1 ((_ sign_extend 32) (size!2013 (buf!2374 bitStream1!8))) ((_ sign_extend 32) (currentByte!4737 bitStream1!8)) ((_ sign_extend 32) (currentBit!4732 bitStream1!8)) nBits!484))))

(declare-fun b!94597 () Bool)

(declare-fun res!77928 () Bool)

(assert (=> b!94597 (=> (not res!77928) (not e!62048))))

(assert (=> b!94597 (= res!77928 (not (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!94598 () Bool)

(declare-fun res!77924 () Bool)

(assert (=> b!94598 (=> (not res!77924) (not e!62048))))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!3530 BitStream!3530 (_ BitVec 64)) List!871)

(assert (=> b!94598 (= res!77924 (= listBits!13 (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484)))))

(declare-fun b!94599 () Bool)

(assert (=> b!94599 (= e!62046 (array_inv!1830 (buf!2374 bitStream2!8)))))

(declare-fun b!94600 () Bool)

(declare-fun res!77929 () Bool)

(assert (=> b!94600 (=> (not res!77929) (not e!62048))))

(assert (=> b!94600 (= res!77929 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2013 (buf!2374 bitStream1!8)) (currentByte!4737 bitStream1!8) (currentBit!4732 bitStream1!8))) (bitIndex!0 (size!2013 (buf!2374 bitStream2!8)) (currentByte!4737 bitStream2!8) (currentBit!4732 bitStream2!8))))))

(declare-fun b!94601 () Bool)

(assert (=> b!94601 (= e!62044 (array_inv!1830 (buf!2374 base!8)))))

(declare-fun b!94602 () Bool)

(declare-fun res!77923 () Bool)

(assert (=> b!94602 (=> (not res!77923) (not e!62048))))

(assert (=> b!94602 (= res!77923 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!94603 () Bool)

(assert (=> b!94603 (= e!62047 (array_inv!1830 (buf!2374 thiss!1534)))))

(declare-fun b!94604 () Bool)

(declare-fun res!77926 () Bool)

(assert (=> b!94604 (=> (not res!77926) (not e!62048))))

(assert (=> b!94604 (= res!77926 (isPrefixOf!0 bitStream2!8 base!8))))

(assert (= (and start!18954 res!77927) b!94594))

(assert (= (and b!94594 res!77925) b!94590))

(assert (= (and b!94590 res!77930) b!94604))

(assert (= (and b!94604 res!77926) b!94602))

(assert (= (and b!94602 res!77923) b!94595))

(assert (= (and b!94595 res!77932) b!94589))

(assert (= (and b!94589 res!77934) b!94600))

(assert (= (and b!94600 res!77929) b!94596))

(assert (= (and b!94596 res!77933) b!94592))

(assert (= (and b!94592 res!77931) b!94598))

(assert (= (and b!94598 res!77924) b!94597))

(assert (= (and b!94597 res!77928) b!94593))

(assert (= start!18954 b!94591))

(assert (= start!18954 b!94599))

(assert (= start!18954 b!94601))

(assert (= start!18954 b!94603))

(declare-fun m!138153 () Bool)

(assert (=> b!94589 m!138153))

(declare-fun m!138155 () Bool)

(assert (=> b!94591 m!138155))

(declare-fun m!138157 () Bool)

(assert (=> b!94590 m!138157))

(declare-fun m!138159 () Bool)

(assert (=> b!94592 m!138159))

(declare-fun m!138161 () Bool)

(assert (=> b!94604 m!138161))

(declare-fun m!138163 () Bool)

(assert (=> b!94601 m!138163))

(declare-fun m!138165 () Bool)

(assert (=> start!18954 m!138165))

(declare-fun m!138167 () Bool)

(assert (=> start!18954 m!138167))

(declare-fun m!138169 () Bool)

(assert (=> start!18954 m!138169))

(declare-fun m!138171 () Bool)

(assert (=> start!18954 m!138171))

(declare-fun m!138173 () Bool)

(assert (=> b!94603 m!138173))

(declare-fun m!138175 () Bool)

(assert (=> b!94600 m!138175))

(declare-fun m!138177 () Bool)

(assert (=> b!94600 m!138177))

(declare-fun m!138179 () Bool)

(assert (=> b!94594 m!138179))

(declare-fun m!138181 () Bool)

(assert (=> b!94593 m!138181))

(declare-fun m!138183 () Bool)

(assert (=> b!94602 m!138183))

(declare-fun m!138185 () Bool)

(assert (=> b!94596 m!138185))

(declare-fun m!138187 () Bool)

(assert (=> b!94598 m!138187))

(declare-fun m!138189 () Bool)

(assert (=> b!94599 m!138189))

(push 1)

(assert (not b!94599))

(assert (not b!94590))

(assert (not b!94601))

(assert (not b!94602))

(assert (not b!94600))

(assert (not b!94594))

(assert (not b!94591))

(assert (not b!94589))

(assert (not b!94593))

(assert (not b!94604))

(assert (not b!94592))

(assert (not b!94596))

(assert (not b!94598))

(assert (not b!94603))

(assert (not start!18954))

(check-sat)

(pop 1)

(push 1)

