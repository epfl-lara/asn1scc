; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59636 () Bool)

(assert start!59636)

(declare-fun b!272424 () Bool)

(declare-fun e!192229 () Bool)

(assert (=> b!272424 (= e!192229 true)))

(declare-fun lt!410339 () Bool)

(declare-datatypes ((array!15179 0))(
  ( (array!15180 (arr!7585 (Array (_ BitVec 32) (_ BitVec 8))) (size!6598 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12010 0))(
  ( (BitStream!12011 (buf!7066 array!15179) (currentByte!13067 (_ BitVec 32)) (currentBit!13062 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!12010)

(declare-fun w3!25 () BitStream!12010)

(declare-fun isPrefixOf!0 (BitStream!12010 BitStream!12010) Bool)

(assert (=> b!272424 (= lt!410339 (isPrefixOf!0 w1!591 w3!25))))

(declare-fun b!272425 () Bool)

(declare-fun e!192231 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!272425 (= e!192231 (byteRangesEq!0 (select (arr!7585 (buf!7066 w1!591)) (currentByte!13067 w1!591)) (select (arr!7585 (buf!7066 w3!25)) (currentByte!13067 w1!591)) #b00000000000000000000000000000000 (currentBit!13062 w1!591)))))

(declare-fun b!272426 () Bool)

(declare-datatypes ((Unit!19169 0))(
  ( (Unit!19170) )
))
(declare-fun e!192237 () Unit!19169)

(declare-fun Unit!19171 () Unit!19169)

(assert (=> b!272426 (= e!192237 Unit!19171)))

(declare-fun b!272427 () Bool)

(declare-fun e!192228 () Bool)

(declare-fun array_inv!6322 (array!15179) Bool)

(assert (=> b!272427 (= e!192228 (array_inv!6322 (buf!7066 w3!25)))))

(declare-fun b!272428 () Bool)

(declare-fun e!192238 () Bool)

(assert (=> b!272428 (= e!192238 (not e!192229))))

(declare-fun res!226889 () Bool)

(assert (=> b!272428 (=> res!226889 e!192229)))

(declare-fun e!192226 () Bool)

(assert (=> b!272428 (= res!226889 e!192226)))

(declare-fun res!226893 () Bool)

(assert (=> b!272428 (=> (not res!226893) (not e!192226))))

(assert (=> b!272428 (= res!226893 (bvslt (currentByte!13067 w1!591) (size!6598 (buf!7066 w1!591))))))

(declare-fun lt!410342 () Unit!19169)

(assert (=> b!272428 (= lt!410342 e!192237)))

(declare-fun c!12549 () Bool)

(declare-fun w2!587 () BitStream!12010)

(assert (=> b!272428 (= c!12549 (and (bvslt (currentByte!13067 w1!591) (size!6598 (buf!7066 w1!591))) (bvslt (currentByte!13067 w1!591) (currentByte!13067 w2!587))))))

(declare-fun e!192233 () Bool)

(assert (=> b!272428 e!192233))

(declare-fun res!226890 () Bool)

(assert (=> b!272428 (=> (not res!226890) (not e!192233))))

(declare-fun arrayRangesEq!1130 (array!15179 array!15179 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!272428 (= res!226890 (arrayRangesEq!1130 (buf!7066 w1!591) (buf!7066 w3!25) #b00000000000000000000000000000000 (currentByte!13067 w1!591)))))

(declare-fun lt!410340 () Unit!19169)

(declare-fun arrayRangesEqTransitive!393 (array!15179 array!15179 array!15179 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19169)

(assert (=> b!272428 (= lt!410340 (arrayRangesEqTransitive!393 (buf!7066 w1!591) (buf!7066 w2!587) (buf!7066 w3!25) #b00000000000000000000000000000000 (currentByte!13067 w1!591) (currentByte!13067 w2!587)))))

(declare-fun b!272429 () Bool)

(declare-fun e!192232 () Bool)

(assert (=> b!272429 (= e!192232 (byteRangesEq!0 (select (arr!7585 (buf!7066 w1!591)) (currentByte!13067 w1!591)) (select (arr!7585 (buf!7066 w3!25)) (currentByte!13067 w1!591)) #b00000000000000000000000000000000 (currentBit!13062 w1!591)))))

(declare-fun b!272430 () Bool)

(assert (=> b!272430 (= e!192233 e!192232)))

(declare-fun res!226894 () Bool)

(assert (=> b!272430 (=> res!226894 e!192232)))

(assert (=> b!272430 (= res!226894 (or (bvsge (currentByte!13067 w1!591) (size!6598 (buf!7066 w1!591))) (bvslt (currentByte!13067 w1!591) (currentByte!13067 w2!587))))))

(declare-fun b!272431 () Bool)

(declare-fun Unit!19172 () Unit!19169)

(assert (=> b!272431 (= e!192237 Unit!19172)))

(declare-fun lt!410341 () Unit!19169)

(declare-fun arrayRangesEqImpliesEq!181 (array!15179 array!15179 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19169)

(assert (=> b!272431 (= lt!410341 (arrayRangesEqImpliesEq!181 (buf!7066 w2!587) (buf!7066 w3!25) #b00000000000000000000000000000000 (currentByte!13067 w1!591) (currentByte!13067 w2!587)))))

(declare-fun res!226891 () Bool)

(assert (=> b!272431 (= res!226891 (= (select (arr!7585 (buf!7066 w2!587)) (currentByte!13067 w1!591)) (select (arr!7585 (buf!7066 w3!25)) (currentByte!13067 w1!591))))))

(assert (=> b!272431 (=> (not res!226891) (not e!192231))))

(assert (=> b!272431 e!192231))

(declare-fun b!272432 () Bool)

(declare-fun e!192230 () Bool)

(assert (=> b!272432 (= e!192230 (array_inv!6322 (buf!7066 w2!587)))))

(declare-fun b!272433 () Bool)

(declare-fun e!192234 () Bool)

(assert (=> b!272433 (= e!192234 (array_inv!6322 (buf!7066 w1!591)))))

(declare-fun b!272434 () Bool)

(declare-fun res!226892 () Bool)

(assert (=> b!272434 (=> (not res!226892) (not e!192238))))

(assert (=> b!272434 (= res!226892 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun res!226888 () Bool)

(assert (=> start!59636 (=> (not res!226888) (not e!192238))))

(assert (=> start!59636 (= res!226888 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!59636 e!192238))

(declare-fun inv!12 (BitStream!12010) Bool)

(assert (=> start!59636 (and (inv!12 w1!591) e!192234)))

(assert (=> start!59636 (and (inv!12 w2!587) e!192230)))

(assert (=> start!59636 (and (inv!12 w3!25) e!192228)))

(declare-fun b!272435 () Bool)

(assert (=> b!272435 (= e!192226 (not (byteRangesEq!0 (select (arr!7585 (buf!7066 w1!591)) (currentByte!13067 w1!591)) (select (arr!7585 (buf!7066 w3!25)) (currentByte!13067 w1!591)) #b00000000000000000000000000000000 (currentBit!13062 w1!591))))))

(assert (= (and start!59636 res!226888) b!272434))

(assert (= (and b!272434 res!226892) b!272428))

(assert (= (and b!272428 res!226890) b!272430))

(assert (= (and b!272430 (not res!226894)) b!272429))

(assert (= (and b!272428 c!12549) b!272431))

(assert (= (and b!272428 (not c!12549)) b!272426))

(assert (= (and b!272431 res!226891) b!272425))

(assert (= (and b!272428 res!226893) b!272435))

(assert (= (and b!272428 (not res!226889)) b!272424))

(assert (= start!59636 b!272433))

(assert (= start!59636 b!272432))

(assert (= start!59636 b!272427))

(declare-fun m!405225 () Bool)

(assert (=> start!59636 m!405225))

(declare-fun m!405227 () Bool)

(assert (=> start!59636 m!405227))

(declare-fun m!405229 () Bool)

(assert (=> start!59636 m!405229))

(declare-fun m!405231 () Bool)

(assert (=> start!59636 m!405231))

(declare-fun m!405233 () Bool)

(assert (=> b!272424 m!405233))

(declare-fun m!405235 () Bool)

(assert (=> b!272432 m!405235))

(declare-fun m!405237 () Bool)

(assert (=> b!272429 m!405237))

(declare-fun m!405239 () Bool)

(assert (=> b!272429 m!405239))

(assert (=> b!272429 m!405237))

(assert (=> b!272429 m!405239))

(declare-fun m!405241 () Bool)

(assert (=> b!272429 m!405241))

(assert (=> b!272425 m!405237))

(assert (=> b!272425 m!405239))

(assert (=> b!272425 m!405237))

(assert (=> b!272425 m!405239))

(assert (=> b!272425 m!405241))

(declare-fun m!405243 () Bool)

(assert (=> b!272427 m!405243))

(declare-fun m!405245 () Bool)

(assert (=> b!272434 m!405245))

(declare-fun m!405247 () Bool)

(assert (=> b!272431 m!405247))

(declare-fun m!405249 () Bool)

(assert (=> b!272431 m!405249))

(assert (=> b!272431 m!405239))

(declare-fun m!405251 () Bool)

(assert (=> b!272433 m!405251))

(declare-fun m!405253 () Bool)

(assert (=> b!272428 m!405253))

(declare-fun m!405255 () Bool)

(assert (=> b!272428 m!405255))

(assert (=> b!272435 m!405237))

(assert (=> b!272435 m!405239))

(assert (=> b!272435 m!405237))

(assert (=> b!272435 m!405239))

(assert (=> b!272435 m!405241))

(push 1)

(assert (not b!272429))

(assert (not b!272428))

(assert (not b!272434))

(assert (not b!272432))

(assert (not start!59636))

(assert (not b!272425))

(assert (not b!272427))

(assert (not b!272435))

(assert (not b!272431))

(assert (not b!272433))

(assert (not b!272424))

(check-sat)

(pop 1)

