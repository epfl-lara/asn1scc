; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18660 () Bool)

(assert start!18660)

(declare-fun b!92550 () Bool)

(declare-fun e!60831 () Bool)

(declare-datatypes ((array!4332 0))(
  ( (array!4333 (arr!2583 (Array (_ BitVec 32) (_ BitVec 8))) (size!1960 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3454 0))(
  ( (BitStream!3455 (buf!2336 array!4332) (currentByte!4661 (_ BitVec 32)) (currentBit!4656 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3454)

(declare-fun array_inv!1792 (array!4332) Bool)

(assert (=> b!92550 (= e!60831 (array_inv!1792 (buf!2336 bitStream1!8)))))

(declare-fun b!92551 () Bool)

(declare-fun e!60829 () Bool)

(declare-fun bitStream2!8 () BitStream!3454)

(assert (=> b!92551 (= e!60829 (array_inv!1792 (buf!2336 bitStream2!8)))))

(declare-fun res!76406 () Bool)

(declare-fun e!60833 () Bool)

(assert (=> start!18660 (=> (not res!76406) (not e!60833))))

(declare-fun nBits!484 () (_ BitVec 64))

(assert (=> start!18660 (= res!76406 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18660 e!60833))

(assert (=> start!18660 true))

(declare-fun inv!12 (BitStream!3454) Bool)

(assert (=> start!18660 (and (inv!12 bitStream1!8) e!60831)))

(assert (=> start!18660 (and (inv!12 bitStream2!8) e!60829)))

(declare-fun base!8 () BitStream!3454)

(declare-fun e!60828 () Bool)

(assert (=> start!18660 (and (inv!12 base!8) e!60828)))

(declare-fun b!92552 () Bool)

(assert (=> b!92552 (= e!60833 (bvslt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!92553 () Bool)

(declare-fun res!76411 () Bool)

(assert (=> b!92553 (=> (not res!76411) (not e!60833))))

(declare-datatypes ((List!833 0))(
  ( (Nil!830) (Cons!829 (h!948 Bool) (t!1583 List!833)) )
))
(declare-fun listBits!13 () List!833)

(declare-fun length!424 (List!833) Int)

(assert (=> b!92553 (= res!76411 (> (length!424 listBits!13) 0))))

(declare-fun b!92554 () Bool)

(assert (=> b!92554 (= e!60828 (array_inv!1792 (buf!2336 base!8)))))

(declare-fun b!92555 () Bool)

(declare-fun res!76410 () Bool)

(assert (=> b!92555 (=> (not res!76410) (not e!60833))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!92555 (= res!76410 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4656 bitStream1!8))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4661 bitStream1!8))) ((_ extract 31 0) ((_ sign_extend 32) (size!1960 (buf!2336 bitStream1!8))))))))

(declare-fun b!92556 () Bool)

(declare-fun res!76403 () Bool)

(assert (=> b!92556 (=> (not res!76403) (not e!60833))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!92556 (= res!76403 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1960 (buf!2336 bitStream1!8)) (currentByte!4661 bitStream1!8) (currentBit!4656 bitStream1!8))) (bitIndex!0 (size!1960 (buf!2336 bitStream2!8)) (currentByte!4661 bitStream2!8) (currentBit!4656 bitStream2!8))))))

(declare-fun b!92557 () Bool)

(declare-fun res!76412 () Bool)

(assert (=> b!92557 (=> (not res!76412) (not e!60833))))

(assert (=> b!92557 (= res!76412 (and (bvsle ((_ sign_extend 32) (size!1960 (buf!2336 bitStream1!8))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4661 bitStream1!8)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4656 bitStream1!8)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!1960 (buf!2336 bitStream1!8))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4661 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4656 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!92558 () Bool)

(declare-fun res!76409 () Bool)

(assert (=> b!92558 (=> (not res!76409) (not e!60833))))

(declare-fun isPrefixOf!0 (BitStream!3454 BitStream!3454) Bool)

(assert (=> b!92558 (= res!76409 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!92559 () Bool)

(declare-fun res!76405 () Bool)

(assert (=> b!92559 (=> (not res!76405) (not e!60833))))

(assert (=> b!92559 (= res!76405 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!92560 () Bool)

(declare-fun res!76407 () Bool)

(assert (=> b!92560 (=> (not res!76407) (not e!60833))))

(assert (=> b!92560 (= res!76407 (and (= (buf!2336 bitStream1!8) (buf!2336 bitStream2!8)) (= (buf!2336 bitStream1!8) (buf!2336 base!8))))))

(declare-fun b!92561 () Bool)

(declare-fun res!76404 () Bool)

(assert (=> b!92561 (=> (not res!76404) (not e!60833))))

(assert (=> b!92561 (= res!76404 (bvslt (bitIndex!0 (size!1960 (buf!2336 base!8)) (currentByte!4661 base!8) (currentBit!4656 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!92562 () Bool)

(declare-fun res!76408 () Bool)

(assert (=> b!92562 (=> (not res!76408) (not e!60833))))

(assert (=> b!92562 (= res!76408 (isPrefixOf!0 bitStream2!8 base!8))))

(assert (= (and start!18660 res!76406) b!92553))

(assert (= (and b!92553 res!76411) b!92558))

(assert (= (and b!92558 res!76409) b!92562))

(assert (= (and b!92562 res!76408) b!92559))

(assert (= (and b!92559 res!76405) b!92560))

(assert (= (and b!92560 res!76407) b!92561))

(assert (= (and b!92561 res!76404) b!92556))

(assert (= (and b!92556 res!76403) b!92557))

(assert (= (and b!92557 res!76412) b!92555))

(assert (= (and b!92555 res!76410) b!92552))

(assert (= start!18660 b!92550))

(assert (= start!18660 b!92551))

(assert (= start!18660 b!92554))

(declare-fun m!136505 () Bool)

(assert (=> b!92551 m!136505))

(declare-fun m!136507 () Bool)

(assert (=> b!92554 m!136507))

(declare-fun m!136509 () Bool)

(assert (=> start!18660 m!136509))

(declare-fun m!136511 () Bool)

(assert (=> start!18660 m!136511))

(declare-fun m!136513 () Bool)

(assert (=> start!18660 m!136513))

(declare-fun m!136515 () Bool)

(assert (=> b!92556 m!136515))

(declare-fun m!136517 () Bool)

(assert (=> b!92556 m!136517))

(declare-fun m!136519 () Bool)

(assert (=> b!92550 m!136519))

(declare-fun m!136521 () Bool)

(assert (=> b!92558 m!136521))

(declare-fun m!136523 () Bool)

(assert (=> b!92553 m!136523))

(declare-fun m!136525 () Bool)

(assert (=> b!92561 m!136525))

(declare-fun m!136527 () Bool)

(assert (=> b!92555 m!136527))

(declare-fun m!136529 () Bool)

(assert (=> b!92559 m!136529))

(declare-fun m!136531 () Bool)

(assert (=> b!92562 m!136531))

(push 1)

(assert (not b!92554))

(assert (not b!92550))

(assert (not b!92553))

(assert (not b!92555))

(assert (not b!92551))

(assert (not b!92558))

(assert (not b!92561))

(assert (not b!92559))

(assert (not b!92556))

(assert (not b!92562))

(assert (not start!18660))

(check-sat)

(pop 1)

(push 1)

(check-sat)

