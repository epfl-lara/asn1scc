; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18798 () Bool)

(assert start!18798)

(declare-fun b!93700 () Bool)

(declare-fun res!77292 () Bool)

(declare-fun e!61538 () Bool)

(assert (=> b!93700 (=> (not res!77292) (not e!61538))))

(declare-datatypes ((array!4390 0))(
  ( (array!4391 (arr!2609 (Array (_ BitVec 32) (_ BitVec 8))) (size!1992 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3506 0))(
  ( (BitStream!3507 (buf!2362 array!4390) (currentByte!4704 (_ BitVec 32)) (currentBit!4699 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3506)

(declare-fun base!8 () BitStream!3506)

(declare-fun isPrefixOf!0 (BitStream!3506 BitStream!3506) Bool)

(assert (=> b!93700 (= res!77292 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!93701 () Bool)

(declare-fun res!77288 () Bool)

(assert (=> b!93701 (=> (not res!77288) (not e!61538))))

(declare-fun bitStream2!8 () BitStream!3506)

(assert (=> b!93701 (= res!77288 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!93703 () Bool)

(declare-fun res!77293 () Bool)

(assert (=> b!93703 (=> (not res!77293) (not e!61538))))

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!93703 (= res!77293 (validate_offset_bits!1 ((_ sign_extend 32) (size!1992 (buf!2362 bitStream2!8))) ((_ sign_extend 32) (currentByte!4704 bitStream2!8)) ((_ sign_extend 32) (currentBit!4699 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!93704 () Bool)

(declare-fun res!77290 () Bool)

(assert (=> b!93704 (=> (not res!77290) (not e!61538))))

(assert (=> b!93704 (= res!77290 (and (= (buf!2362 bitStream1!8) (buf!2362 bitStream2!8)) (= (buf!2362 bitStream1!8) (buf!2362 base!8))))))

(declare-fun b!93705 () Bool)

(declare-fun e!61536 () Bool)

(declare-fun thiss!1534 () BitStream!3506)

(declare-fun array_inv!1818 (array!4390) Bool)

(assert (=> b!93705 (= e!61536 (array_inv!1818 (buf!2362 thiss!1534)))))

(declare-fun b!93706 () Bool)

(declare-fun e!61537 () Bool)

(assert (=> b!93706 (= e!61537 (array_inv!1818 (buf!2362 base!8)))))

(declare-fun b!93707 () Bool)

(declare-fun e!61534 () Bool)

(assert (=> b!93707 (= e!61534 (array_inv!1818 (buf!2362 bitStream1!8)))))

(declare-fun b!93708 () Bool)

(declare-fun res!77289 () Bool)

(assert (=> b!93708 (=> (not res!77289) (not e!61538))))

(assert (=> b!93708 (= res!77289 (validate_offset_bits!1 ((_ sign_extend 32) (size!1992 (buf!2362 bitStream1!8))) ((_ sign_extend 32) (currentByte!4704 bitStream1!8)) ((_ sign_extend 32) (currentBit!4699 bitStream1!8)) nBits!484))))

(declare-fun b!93709 () Bool)

(assert (=> b!93709 (= e!61538 false)))

(declare-datatypes ((List!859 0))(
  ( (Nil!856) (Cons!855 (h!974 Bool) (t!1609 List!859)) )
))
(declare-fun lt!138480 () List!859)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!3506 BitStream!3506 (_ BitVec 64)) List!859)

(assert (=> b!93709 (= lt!138480 (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484))))

(declare-fun b!93710 () Bool)

(declare-fun res!77295 () Bool)

(assert (=> b!93710 (=> (not res!77295) (not e!61538))))

(declare-fun listBits!13 () List!859)

(declare-fun length!450 (List!859) Int)

(assert (=> b!93710 (= res!77295 (> (length!450 listBits!13) 0))))

(declare-fun b!93711 () Bool)

(declare-fun res!77287 () Bool)

(assert (=> b!93711 (=> (not res!77287) (not e!61538))))

(assert (=> b!93711 (= res!77287 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun res!77286 () Bool)

(assert (=> start!18798 (=> (not res!77286) (not e!61538))))

(assert (=> start!18798 (= res!77286 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18798 e!61538))

(assert (=> start!18798 true))

(declare-fun inv!12 (BitStream!3506) Bool)

(assert (=> start!18798 (and (inv!12 bitStream1!8) e!61534)))

(declare-fun e!61535 () Bool)

(assert (=> start!18798 (and (inv!12 bitStream2!8) e!61535)))

(assert (=> start!18798 (and (inv!12 base!8) e!61537)))

(assert (=> start!18798 (and (inv!12 thiss!1534) e!61536)))

(declare-fun b!93702 () Bool)

(declare-fun res!77291 () Bool)

(assert (=> b!93702 (=> (not res!77291) (not e!61538))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!93702 (= res!77291 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1992 (buf!2362 bitStream1!8)) (currentByte!4704 bitStream1!8) (currentBit!4699 bitStream1!8))) (bitIndex!0 (size!1992 (buf!2362 bitStream2!8)) (currentByte!4704 bitStream2!8) (currentBit!4699 bitStream2!8))))))

(declare-fun b!93712 () Bool)

(declare-fun res!77294 () Bool)

(assert (=> b!93712 (=> (not res!77294) (not e!61538))))

(assert (=> b!93712 (= res!77294 (bvslt (bitIndex!0 (size!1992 (buf!2362 base!8)) (currentByte!4704 base!8) (currentBit!4699 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!93713 () Bool)

(assert (=> b!93713 (= e!61535 (array_inv!1818 (buf!2362 bitStream2!8)))))

(assert (= (and start!18798 res!77286) b!93710))

(assert (= (and b!93710 res!77295) b!93700))

(assert (= (and b!93700 res!77292) b!93701))

(assert (= (and b!93701 res!77288) b!93711))

(assert (= (and b!93711 res!77287) b!93704))

(assert (= (and b!93704 res!77290) b!93712))

(assert (= (and b!93712 res!77294) b!93702))

(assert (= (and b!93702 res!77291) b!93708))

(assert (= (and b!93708 res!77289) b!93703))

(assert (= (and b!93703 res!77293) b!93709))

(assert (= start!18798 b!93707))

(assert (= start!18798 b!93713))

(assert (= start!18798 b!93706))

(assert (= start!18798 b!93705))

(declare-fun m!137441 () Bool)

(assert (=> b!93706 m!137441))

(declare-fun m!137443 () Bool)

(assert (=> b!93711 m!137443))

(declare-fun m!137445 () Bool)

(assert (=> b!93703 m!137445))

(declare-fun m!137447 () Bool)

(assert (=> b!93713 m!137447))

(declare-fun m!137449 () Bool)

(assert (=> b!93712 m!137449))

(declare-fun m!137451 () Bool)

(assert (=> b!93701 m!137451))

(declare-fun m!137453 () Bool)

(assert (=> b!93708 m!137453))

(declare-fun m!137455 () Bool)

(assert (=> b!93707 m!137455))

(declare-fun m!137457 () Bool)

(assert (=> b!93705 m!137457))

(declare-fun m!137459 () Bool)

(assert (=> b!93700 m!137459))

(declare-fun m!137461 () Bool)

(assert (=> start!18798 m!137461))

(declare-fun m!137463 () Bool)

(assert (=> start!18798 m!137463))

(declare-fun m!137465 () Bool)

(assert (=> start!18798 m!137465))

(declare-fun m!137467 () Bool)

(assert (=> start!18798 m!137467))

(declare-fun m!137469 () Bool)

(assert (=> b!93709 m!137469))

(declare-fun m!137471 () Bool)

(assert (=> b!93702 m!137471))

(declare-fun m!137473 () Bool)

(assert (=> b!93702 m!137473))

(declare-fun m!137475 () Bool)

(assert (=> b!93710 m!137475))

(push 1)

(assert (not b!93712))

(assert (not b!93707))

(assert (not start!18798))

(assert (not b!93709))

(assert (not b!93708))

(assert (not b!93703))

(assert (not b!93713))

(assert (not b!93701))

(assert (not b!93711))

(assert (not b!93705))

(assert (not b!93710))

(assert (not b!93702))

(assert (not b!93700))

(assert (not b!93706))

(check-sat)

(pop 1)

