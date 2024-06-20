; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18794 () Bool)

(assert start!18794)

(declare-fun b!93616 () Bool)

(declare-fun res!77232 () Bool)

(declare-fun e!61477 () Bool)

(assert (=> b!93616 (=> (not res!77232) (not e!61477))))

(declare-datatypes ((List!857 0))(
  ( (Nil!854) (Cons!853 (h!972 Bool) (t!1607 List!857)) )
))
(declare-fun listBits!13 () List!857)

(declare-fun length!448 (List!857) Int)

(assert (=> b!93616 (= res!77232 (> (length!448 listBits!13) 0))))

(declare-fun b!93617 () Bool)

(declare-fun res!77228 () Bool)

(assert (=> b!93617 (=> (not res!77228) (not e!61477))))

(declare-datatypes ((array!4386 0))(
  ( (array!4387 (arr!2607 (Array (_ BitVec 32) (_ BitVec 8))) (size!1990 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3502 0))(
  ( (BitStream!3503 (buf!2360 array!4386) (currentByte!4702 (_ BitVec 32)) (currentBit!4697 (_ BitVec 32))) )
))
(declare-fun bitStream2!8 () BitStream!3502)

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!93617 (= res!77228 (validate_offset_bits!1 ((_ sign_extend 32) (size!1990 (buf!2360 bitStream2!8))) ((_ sign_extend 32) (currentByte!4702 bitStream2!8)) ((_ sign_extend 32) (currentBit!4697 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun res!77235 () Bool)

(assert (=> start!18794 (=> (not res!77235) (not e!61477))))

(assert (=> start!18794 (= res!77235 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18794 e!61477))

(assert (=> start!18794 true))

(declare-fun bitStream1!8 () BitStream!3502)

(declare-fun e!61480 () Bool)

(declare-fun inv!12 (BitStream!3502) Bool)

(assert (=> start!18794 (and (inv!12 bitStream1!8) e!61480)))

(declare-fun e!61482 () Bool)

(assert (=> start!18794 (and (inv!12 bitStream2!8) e!61482)))

(declare-fun base!8 () BitStream!3502)

(declare-fun e!61478 () Bool)

(assert (=> start!18794 (and (inv!12 base!8) e!61478)))

(declare-fun thiss!1534 () BitStream!3502)

(declare-fun e!61485 () Bool)

(assert (=> start!18794 (and (inv!12 thiss!1534) e!61485)))

(declare-fun b!93618 () Bool)

(declare-fun array_inv!1816 (array!4386) Bool)

(assert (=> b!93618 (= e!61482 (array_inv!1816 (buf!2360 bitStream2!8)))))

(declare-fun b!93619 () Bool)

(assert (=> b!93619 (= e!61485 (array_inv!1816 (buf!2360 thiss!1534)))))

(declare-fun b!93620 () Bool)

(assert (=> b!93620 (= e!61480 (array_inv!1816 (buf!2360 bitStream1!8)))))

(declare-fun b!93621 () Bool)

(declare-fun res!77230 () Bool)

(assert (=> b!93621 (=> (not res!77230) (not e!61477))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!93621 (= res!77230 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1990 (buf!2360 bitStream1!8)) (currentByte!4702 bitStream1!8) (currentBit!4697 bitStream1!8))) (bitIndex!0 (size!1990 (buf!2360 bitStream2!8)) (currentByte!4702 bitStream2!8) (currentBit!4697 bitStream2!8))))))

(declare-fun b!93622 () Bool)

(declare-fun res!77226 () Bool)

(assert (=> b!93622 (=> (not res!77226) (not e!61477))))

(assert (=> b!93622 (= res!77226 (validate_offset_bits!1 ((_ sign_extend 32) (size!1990 (buf!2360 bitStream1!8))) ((_ sign_extend 32) (currentByte!4702 bitStream1!8)) ((_ sign_extend 32) (currentBit!4697 bitStream1!8)) nBits!484))))

(declare-fun b!93623 () Bool)

(declare-fun res!77229 () Bool)

(assert (=> b!93623 (=> (not res!77229) (not e!61477))))

(assert (=> b!93623 (= res!77229 (bvslt (bitIndex!0 (size!1990 (buf!2360 base!8)) (currentByte!4702 base!8) (currentBit!4697 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!93624 () Bool)

(declare-fun res!77233 () Bool)

(assert (=> b!93624 (=> (not res!77233) (not e!61477))))

(declare-fun isPrefixOf!0 (BitStream!3502 BitStream!3502) Bool)

(assert (=> b!93624 (= res!77233 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!93625 () Bool)

(assert (=> b!93625 (= e!61478 (array_inv!1816 (buf!2360 base!8)))))

(declare-fun b!93626 () Bool)

(declare-fun res!77231 () Bool)

(assert (=> b!93626 (=> (not res!77231) (not e!61477))))

(assert (=> b!93626 (= res!77231 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!93627 () Bool)

(declare-fun res!77234 () Bool)

(assert (=> b!93627 (=> (not res!77234) (not e!61477))))

(assert (=> b!93627 (= res!77234 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!93628 () Bool)

(declare-fun res!77227 () Bool)

(assert (=> b!93628 (=> (not res!77227) (not e!61477))))

(assert (=> b!93628 (= res!77227 (and (= (buf!2360 bitStream1!8) (buf!2360 bitStream2!8)) (= (buf!2360 bitStream1!8) (buf!2360 base!8))))))

(declare-fun b!93629 () Bool)

(assert (=> b!93629 (= e!61477 false)))

(declare-fun lt!138474 () List!857)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!3502 BitStream!3502 (_ BitVec 64)) List!857)

(assert (=> b!93629 (= lt!138474 (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484))))

(assert (= (and start!18794 res!77235) b!93616))

(assert (= (and b!93616 res!77232) b!93624))

(assert (= (and b!93624 res!77233) b!93626))

(assert (= (and b!93626 res!77231) b!93627))

(assert (= (and b!93627 res!77234) b!93628))

(assert (= (and b!93628 res!77227) b!93623))

(assert (= (and b!93623 res!77229) b!93621))

(assert (= (and b!93621 res!77230) b!93622))

(assert (= (and b!93622 res!77226) b!93617))

(assert (= (and b!93617 res!77228) b!93629))

(assert (= start!18794 b!93620))

(assert (= start!18794 b!93618))

(assert (= start!18794 b!93625))

(assert (= start!18794 b!93619))

(declare-fun m!137369 () Bool)

(assert (=> b!93622 m!137369))

(declare-fun m!137371 () Bool)

(assert (=> b!93629 m!137371))

(declare-fun m!137373 () Bool)

(assert (=> b!93627 m!137373))

(declare-fun m!137375 () Bool)

(assert (=> b!93618 m!137375))

(declare-fun m!137377 () Bool)

(assert (=> b!93625 m!137377))

(declare-fun m!137379 () Bool)

(assert (=> b!93617 m!137379))

(declare-fun m!137381 () Bool)

(assert (=> start!18794 m!137381))

(declare-fun m!137383 () Bool)

(assert (=> start!18794 m!137383))

(declare-fun m!137385 () Bool)

(assert (=> start!18794 m!137385))

(declare-fun m!137387 () Bool)

(assert (=> start!18794 m!137387))

(declare-fun m!137389 () Bool)

(assert (=> b!93624 m!137389))

(declare-fun m!137391 () Bool)

(assert (=> b!93619 m!137391))

(declare-fun m!137393 () Bool)

(assert (=> b!93621 m!137393))

(declare-fun m!137395 () Bool)

(assert (=> b!93621 m!137395))

(declare-fun m!137397 () Bool)

(assert (=> b!93616 m!137397))

(declare-fun m!137399 () Bool)

(assert (=> b!93620 m!137399))

(declare-fun m!137401 () Bool)

(assert (=> b!93623 m!137401))

(declare-fun m!137403 () Bool)

(assert (=> b!93626 m!137403))

(push 1)

(assert (not b!93625))

(assert (not b!93621))

(assert (not b!93629))

(assert (not b!93619))

(assert (not b!93623))

(assert (not b!93617))

(assert (not b!93616))

(assert (not b!93626))

(assert (not b!93620))

(assert (not b!93618))

(assert (not b!93627))

(assert (not b!93622))

(assert (not b!93624))

(assert (not start!18794))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

