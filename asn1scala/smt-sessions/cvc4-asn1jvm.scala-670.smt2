; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18792 () Bool)

(assert start!18792)

(declare-fun b!93574 () Bool)

(declare-fun e!61456 () Bool)

(declare-datatypes ((array!4384 0))(
  ( (array!4385 (arr!2606 (Array (_ BitVec 32) (_ BitVec 8))) (size!1989 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3500 0))(
  ( (BitStream!3501 (buf!2359 array!4384) (currentByte!4701 (_ BitVec 32)) (currentBit!4696 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3500)

(declare-fun array_inv!1815 (array!4384) Bool)

(assert (=> b!93574 (= e!61456 (array_inv!1815 (buf!2359 bitStream1!8)))))

(declare-fun b!93575 () Bool)

(declare-fun res!77205 () Bool)

(declare-fun e!61453 () Bool)

(assert (=> b!93575 (=> (not res!77205) (not e!61453))))

(declare-fun bitStream2!8 () BitStream!3500)

(declare-fun isPrefixOf!0 (BitStream!3500 BitStream!3500) Bool)

(assert (=> b!93575 (= res!77205 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!93577 () Bool)

(declare-fun res!77198 () Bool)

(assert (=> b!93577 (=> (not res!77198) (not e!61453))))

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!93577 (= res!77198 (validate_offset_bits!1 ((_ sign_extend 32) (size!1989 (buf!2359 bitStream1!8))) ((_ sign_extend 32) (currentByte!4701 bitStream1!8)) ((_ sign_extend 32) (currentBit!4696 bitStream1!8)) nBits!484))))

(declare-fun b!93578 () Bool)

(declare-fun res!77199 () Bool)

(assert (=> b!93578 (=> (not res!77199) (not e!61453))))

(declare-fun base!8 () BitStream!3500)

(assert (=> b!93578 (= res!77199 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!93579 () Bool)

(declare-fun res!77197 () Bool)

(assert (=> b!93579 (=> (not res!77197) (not e!61453))))

(declare-datatypes ((List!856 0))(
  ( (Nil!853) (Cons!852 (h!971 Bool) (t!1606 List!856)) )
))
(declare-fun listBits!13 () List!856)

(declare-fun length!447 (List!856) Int)

(assert (=> b!93579 (= res!77197 (> (length!447 listBits!13) 0))))

(declare-fun b!93580 () Bool)

(declare-fun e!61454 () Bool)

(declare-fun thiss!1534 () BitStream!3500)

(assert (=> b!93580 (= e!61454 (array_inv!1815 (buf!2359 thiss!1534)))))

(declare-fun b!93581 () Bool)

(declare-fun res!77204 () Bool)

(assert (=> b!93581 (=> (not res!77204) (not e!61453))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!93581 (= res!77204 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1989 (buf!2359 bitStream1!8)) (currentByte!4701 bitStream1!8) (currentBit!4696 bitStream1!8))) (bitIndex!0 (size!1989 (buf!2359 bitStream2!8)) (currentByte!4701 bitStream2!8) (currentBit!4696 bitStream2!8))))))

(declare-fun b!93582 () Bool)

(declare-fun e!61451 () Bool)

(assert (=> b!93582 (= e!61451 (array_inv!1815 (buf!2359 bitStream2!8)))))

(declare-fun b!93583 () Bool)

(declare-fun e!61452 () Bool)

(assert (=> b!93583 (= e!61452 (array_inv!1815 (buf!2359 base!8)))))

(declare-fun b!93584 () Bool)

(declare-fun res!77201 () Bool)

(assert (=> b!93584 (=> (not res!77201) (not e!61453))))

(assert (=> b!93584 (= res!77201 (validate_offset_bits!1 ((_ sign_extend 32) (size!1989 (buf!2359 bitStream2!8))) ((_ sign_extend 32) (currentByte!4701 bitStream2!8)) ((_ sign_extend 32) (currentBit!4696 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!93585 () Bool)

(declare-fun res!77200 () Bool)

(assert (=> b!93585 (=> (not res!77200) (not e!61453))))

(assert (=> b!93585 (= res!77200 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!93586 () Bool)

(assert (=> b!93586 (= e!61453 false)))

(declare-fun lt!138471 () List!856)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!3500 BitStream!3500 (_ BitVec 64)) List!856)

(assert (=> b!93586 (= lt!138471 (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484))))

(declare-fun b!93587 () Bool)

(declare-fun res!77202 () Bool)

(assert (=> b!93587 (=> (not res!77202) (not e!61453))))

(assert (=> b!93587 (= res!77202 (and (= (buf!2359 bitStream1!8) (buf!2359 bitStream2!8)) (= (buf!2359 bitStream1!8) (buf!2359 base!8))))))

(declare-fun res!77196 () Bool)

(assert (=> start!18792 (=> (not res!77196) (not e!61453))))

(assert (=> start!18792 (= res!77196 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18792 e!61453))

(assert (=> start!18792 true))

(declare-fun inv!12 (BitStream!3500) Bool)

(assert (=> start!18792 (and (inv!12 bitStream1!8) e!61456)))

(assert (=> start!18792 (and (inv!12 bitStream2!8) e!61451)))

(assert (=> start!18792 (and (inv!12 base!8) e!61452)))

(assert (=> start!18792 (and (inv!12 thiss!1534) e!61454)))

(declare-fun b!93576 () Bool)

(declare-fun res!77203 () Bool)

(assert (=> b!93576 (=> (not res!77203) (not e!61453))))

(assert (=> b!93576 (= res!77203 (bvslt (bitIndex!0 (size!1989 (buf!2359 base!8)) (currentByte!4701 base!8) (currentBit!4696 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(assert (= (and start!18792 res!77196) b!93579))

(assert (= (and b!93579 res!77197) b!93578))

(assert (= (and b!93578 res!77199) b!93585))

(assert (= (and b!93585 res!77200) b!93575))

(assert (= (and b!93575 res!77205) b!93587))

(assert (= (and b!93587 res!77202) b!93576))

(assert (= (and b!93576 res!77203) b!93581))

(assert (= (and b!93581 res!77204) b!93577))

(assert (= (and b!93577 res!77198) b!93584))

(assert (= (and b!93584 res!77201) b!93586))

(assert (= start!18792 b!93574))

(assert (= start!18792 b!93582))

(assert (= start!18792 b!93583))

(assert (= start!18792 b!93580))

(declare-fun m!137333 () Bool)

(assert (=> b!93582 m!137333))

(declare-fun m!137335 () Bool)

(assert (=> b!93585 m!137335))

(declare-fun m!137337 () Bool)

(assert (=> b!93580 m!137337))

(declare-fun m!137339 () Bool)

(assert (=> b!93574 m!137339))

(declare-fun m!137341 () Bool)

(assert (=> b!93579 m!137341))

(declare-fun m!137343 () Bool)

(assert (=> start!18792 m!137343))

(declare-fun m!137345 () Bool)

(assert (=> start!18792 m!137345))

(declare-fun m!137347 () Bool)

(assert (=> start!18792 m!137347))

(declare-fun m!137349 () Bool)

(assert (=> start!18792 m!137349))

(declare-fun m!137351 () Bool)

(assert (=> b!93577 m!137351))

(declare-fun m!137353 () Bool)

(assert (=> b!93586 m!137353))

(declare-fun m!137355 () Bool)

(assert (=> b!93583 m!137355))

(declare-fun m!137357 () Bool)

(assert (=> b!93576 m!137357))

(declare-fun m!137359 () Bool)

(assert (=> b!93575 m!137359))

(declare-fun m!137361 () Bool)

(assert (=> b!93584 m!137361))

(declare-fun m!137363 () Bool)

(assert (=> b!93581 m!137363))

(declare-fun m!137365 () Bool)

(assert (=> b!93581 m!137365))

(declare-fun m!137367 () Bool)

(assert (=> b!93578 m!137367))

(push 1)

(assert (not b!93577))

(assert (not b!93580))

(assert (not b!93584))

(assert (not b!93583))

(assert (not b!93582))

(assert (not b!93585))

(assert (not b!93586))

(assert (not b!93576))

(assert (not b!93574))

(assert (not b!93579))

(assert (not b!93578))

(assert (not b!93581))

(assert (not b!93575))

(assert (not start!18792))

(check-sat)

(pop 1)

